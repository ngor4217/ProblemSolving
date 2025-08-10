using System.Reflection;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Text.Json;
using Server;

namespace Client;

public static class Program
{
    private static Config _config;
    
    public async static Task Main(string [] args)
    {
        try
        {
            var configJson = File.ReadAllText("config.json");
            _config = JsonSerializer.Deserialize<Config>(configJson, ServerSerializerContext.Default.Config);
            
            if (_config == null)
            { 
                Console.Out.WriteLine(@"File config.json not exists or invalid, example: 
             {
               ""ListenAddr"": ""0.0.0.0"",
               ""ListenPort"": 5555,
               ""TlsEnabled"": true,
               ""TlsCrt"": ""/etc/some/path.crt"",
               ""TlsKey"": ""/etc/some/path.key"",
               ""Filters"": [    
                 {
                   ""field"": ""type"",
                   ""operator"": ""equals"",
                   ""value"": ""event""
                 },
                 {
                   ""field"": ""level"",
                   ""operator"": ""not_equals"",
                   ""value"": ""debug""
                 }
               ]
             }");
               return;
            }

            using (var server = new Server.Server(_config))
            {
                server.OnMessage += message => HandleMessage(message);
                await server.RestartAsync();
            }
            
            Console.Read();
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.Message);
#if DEBUG
            Console.Error.WriteLine(ex.StackTrace);
#endif 
        }
    }

    private static void HandleMessage(byte [] bytes)
    {
        var text = Encoding.UTF8.GetString(bytes);
        var message = JsonSerializer.Deserialize<Message>(text, ServerSerializerContext.Default.Message);
        if (_config.Filters is { Length: > 0 } && !_config.Filters.All(x =>
            {
                var val = typeof(Message)
                    .GetProperty(x.Field, BindingFlags.IgnoreCase | BindingFlags.Instance | BindingFlags.Public)
                    ?.GetValue(message) as string;
                return x.Operator == "equals" ? val == x.Value : val != x.Value;
            }))
        {
            return;
        }

        Console.Out.WriteLine(text);
    }
}
