using System.Text.Json.Serialization;

namespace Server;

public class Message
{
    [JsonPropertyName("type")]
    public string? Type { get; set; }
    [JsonPropertyName("level")]
    public string? Level { get; set; }
    [JsonPropertyName("message")]
    public string? Content { get; set; }
}
