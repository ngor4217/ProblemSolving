using System.Text.Json.Serialization;

namespace Client;

public class Config
{
    public string InputPath { get; set; }
    public string ServerHost { get; set; }
    [JsonPropertyName("Server_port")]
    public int ServerPort { get; set; }
    public bool TlsEnabled { get; set; }
    public bool TlsValidateCert { get; set; }
}
