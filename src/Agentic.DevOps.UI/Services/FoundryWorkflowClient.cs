using Azure.AI.Projects;
using Azure.AI.Projects.OpenAI;
using Azure.Core;
using OpenAI.Responses;

#pragma warning disable OPENAI001

namespace Agentic.DevOps.UI.Services;

public sealed class FoundryWorkflowClient
{
    private readonly FoundryOptions _options;
    private readonly TokenCredential _credential;

    public FoundryWorkflowClient(FoundryOptions options, TokenCredential credential)
    {
        _options = options;
        _credential = credential;
    }

    public async Task<string> InvokeAsync(string userMessage, CancellationToken ct)
    {
        var projectClient = new AIProjectClient(new Uri(_options.ProjectEndpoint), _credential);
        ProjectConversation conversation = projectClient.OpenAI.Conversations.CreateProjectConversation();

        AgentReference agentReference = new AgentReference(name: _options.AgentName, version: _options.AgentVersion);
        ProjectResponsesClient responseClient =
            projectClient.OpenAI.GetProjectResponsesClientForAgent(agentReference, conversation.Id);

        var options = new CreateResponseOptions
        {
            InputItems = { ResponseItem.CreateUserMessageItem(userMessage) }
        };

        ResponseResult response = await responseClient.CreateResponseAsync(options, ct);
        return response.GetOutputText();
    }
}
