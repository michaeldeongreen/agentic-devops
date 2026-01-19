namespace Agentic.DevOps.UI.Services;

public sealed class FoundryOptions
{
    public const string SectionName = "Foundry";
    public string ProjectEndpoint { get; set; } = "";
    public string AgentName { get; set; } = "";
    public string AgentVersion { get; set; } = "";
    public string UserMessage { get; set; } = "";
    public string Scope { get; set; } = "https://ai.azure.com/.default";
}
