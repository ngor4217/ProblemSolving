using System;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Net.Sockets;
using System.Security.Authentication;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Server;

public class Server(Config config) : IDisposable
{
    Config _config = config;
    TcpListener? _tcpListener;
    public bool IsActive { get; private set; }
    public delegate void OnMessageDelegate(byte[] message);
    
    /// <summary>
    /// Triggers when receiving bytes
    /// </summary>
    public event OnMessageDelegate? OnMessage;
    
    public async ValueTask RestartAsync()
    {
        if (IsActive)
            return;

        _tcpListener = new TcpListener(IPAddress.Any, _config.ListenPort);
        _tcpListener.Start();
        IsActive = true;
        Console.Out.WriteLine("Listening on port {0}", _config.ListenPort);
        
            while (true)
            {
                try
                {
                    var client = await _tcpListener.AcceptTcpClientAsync();
                    Console.Out.WriteLine($"Connected {client.Client.RemoteEndPoint}");
                    Task.Run(async () =>
                    {
                        await ListenClientAsync(client);
                    });
                }
                catch (InvalidOperationException ex)
                {
                    Console.Error.WriteLine(ex.Message);
                    break;
                }
                catch (SocketException e)
                {
                    Console.Error.WriteLine($"{e.ErrorCode}:{e.Message}");
                }
            }
    }

    private async ValueTask ListenClientAsync(TcpClient client)
    {
        try
        {
            using var networkStream = client.GetStream();
            if (_config.TlsEnabled)
            {
                using var sslStream = new SslStream(networkStream, false);
                var serverCertificate = X509Certificate2.CreateFromPemFile(_config.TlsCrt, _config.TlsKey);
                
                await sslStream.AuthenticateAsServerAsync(serverCertificate, 
                    clientCertificateRequired: false, 
                    enabledSslProtocols: SslProtocols.Tls12 | SslProtocols.Tls13, 
                    checkCertificateRevocation: false);
                    
                await BeginReadStreamAsync(sslStream, client.SendBufferSize);
            }
            else
            {
                await BeginReadStreamAsync(networkStream, client.SendBufferSize);
            }
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.Message);
            client.Close();
        }
    }

    private async ValueTask BeginReadStreamAsync(Stream stream, int bufferSize)
    {
        var buffer = new byte[bufferSize];
        using var message = new MemoryStream();
        int size;
        do
        {
            size = await stream.ReadAsync(buffer, 0, buffer.Length);
            for (int i = 0; i < size; i++)
            {
                if (buffer[i] != (byte)10m)
                {
                    message.WriteByte(buffer[i]);
                }
                else
                {
                    if (message.Length > 0)
                    {
                        try
                        {
                            OnMessage?.Invoke(message.ToArray()); 
                        }
                        catch (Exception e)
                        {
                            Console.Error.WriteLine(e.Message);
                        }
                        message.SetLength(0);
                        message.Position = 0;
                    }
                }
            }
        } while (size > 0);
    }

    public void Dispose()
    {
        _tcpListener?.Stop();
        IsActive = false;
        _tcpListener = null;
    }
}
