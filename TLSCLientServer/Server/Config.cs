using System.Text.Json.Serialization;

namespace Server;

public class Config
{
    public string ListenAddr { get; set; }
    public int ListenPort { get; set; }
    public bool TlsEnabled { get; set; }
    public string TlsCrt { get; set; }
    public string TlsKey { get; set; }
    public Filter[]? Filters { get; set; }
}

public class Filter
{
    [JsonPropertyName("field")]
    public string Field { get; set; }
    [JsonPropertyName("operator")]
    public string Operator  { get; set; }
    [JsonPropertyName("value")]
    public string Value { get; set; }
}
