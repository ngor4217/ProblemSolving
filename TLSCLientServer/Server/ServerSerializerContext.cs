using System.Text.Json.Serialization;

namespace Server;

[JsonSourceGenerationOptions(WriteIndented = true, DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull)]
[JsonSerializable(typeof(Config))]
[JsonSerializable(typeof(Filter))]
[JsonSerializable(typeof(Message))]
public partial class ServerSerializerContext : JsonSerializerContext
{
}
