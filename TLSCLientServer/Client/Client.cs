using System.Net.Security;
using System.Net.Sockets;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Client;

public class Client(Config config) : IDisposable
{
    private TcpClient? _tcpClient;
    private Stream? _stream;
    
    public bool IsActive {get; private set; }

    public async ValueTask Connect()
    {
        _tcpClient = new TcpClient();
        await _tcpClient.ConnectAsync(config.ServerHost, config.ServerPort);
        IsActive = true;
    }

    public async ValueTask SendAsync(byte [] message)
    {
        if (!IsActive || _tcpClient == null)
            throw new Exception("Connect to server before send");

        try
        {
            if (_stream == null)
            {
                if (config.TlsEnabled)
                {
                    _stream = new SslStream(_tcpClient.GetStream(), false, ValidateServerCertificate);
                    await (_stream as SslStream)!.AuthenticateAsClientAsync(config.ServerHost, null,
                        SslProtocols.Tls12 | SslProtocols.Tls13, false);
                }
                else
                {
                    _stream = _tcpClient.GetStream();
                }
            }

            await _stream.WriteAsync(message, 0, message.Length);
        }
        catch (Exception e)
        {
            Console.Error.WriteLine(e);
            throw;
        }
    }

    private bool ValidateServerCertificate(object sender, X509Certificate? certificate, X509Chain? chain, SslPolicyErrors sslpolicyerrors)
    {
        if (config.TlsValidateCert)
        {
            var x509v3 = new X509Certificate2(certificate);

            return x509v3.Verify();
        }
        
        return true;
    }
    public void Dispose()
    {
        _stream?.Dispose();
        _tcpClient?.Close();
        IsActive = false;
    }
}
