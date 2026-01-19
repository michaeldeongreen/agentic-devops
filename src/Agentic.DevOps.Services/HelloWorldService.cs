using Agentic.DevOps.Services.Interfaces;

namespace Agentic.DevOps.Services;

/// <summary>
/// Provides a simple hello world greeting.
/// </summary>
public class HelloWorldService : IHelloWorldService
{
    private const string HelloWorldMessage = "Hello World";

    /// <summary>
    /// Returns a greeting message.
    /// </summary>
    /// <returns>The greeting message.</returns>
    public string SayHello()
    {
        return HelloWorldMessage;
    }
}
