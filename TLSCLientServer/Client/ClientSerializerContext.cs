using System.Text.Json.Serialization;

namespace Client;

[JsonSourceGenerationOptions(WriteIndented = true, DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull)]
[JsonSerializable(typeof(Config))]
public partial class ClientSerializerContext : JsonSerializerContext
{
}

