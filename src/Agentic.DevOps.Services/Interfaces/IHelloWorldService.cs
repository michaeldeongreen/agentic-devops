namespace Agentic.DevOps.Services.Interfaces;

/// <summary>
/// Defines a service that returns a greeting message.
/// </summary>
public interface IHelloWorldService
{
    /// <summary>
    /// Returns a greeting message.
    /// </summary>
    /// <returns>The greeting message.</returns>
    string SayHello();
}
