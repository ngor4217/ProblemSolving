using System.Text;
using System.Text.Json;
namespace Client;

public static class Program
{
    public async static Task Main(string [] args)
    {
        try
        {
            var configJson = await File.ReadAllTextAsync("config.json");
            var config = JsonSerializer.Deserialize<Config>(configJson, ClientSerializerContext.Default.Config);
            if (config == null)
            {
                Console.Out.WriteLine(@"File config.json not exists or invalid, example: 
{
  ""InputPath"": ""/var/data.json"", 
  ""ServerHost"": ""localhost"",
  ""Server_port"": 5555,
  ""TlsEnabled"": true,
  ""TlsValidateCert"": false
}");
                return;
            }
            
            if (args.Length == 0)
            {
                Console.Out.WriteLine("Specify path of UTF8 JSON file of '\\n' separated messages");
                return;
            }
            
            var lines = await File.ReadAllLinesAsync(args[0], Encoding.UTF8);
            
            using var client = new Client(config);
            await client.Connect();
            
            foreach (var line in lines)
            {
                if (Validate(line))
                {
                    var message = Encoding.UTF8.GetBytes(line + '\n');
                    await client.SendAsync(message);  
                }
                else
                {
                    Console.Error.WriteLine(line);
                }
            }
            Console.Out.WriteLine(@"Done!");
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.Message);
#if DEBUG
            Console.Error.WriteLine(ex.StackTrace);
#endif 
        }
    }

    private static bool Validate(string text)
    {
        if (string.IsNullOrWhiteSpace(text))
        {
            return false;
        }

        try
        {
            JsonDocument.Parse(text).Dispose();
        }
        catch
        {
            return false;
        }
        return true;
    }
}
