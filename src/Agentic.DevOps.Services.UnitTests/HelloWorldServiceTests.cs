using Agentic.DevOps.Services;

namespace Agentic.DevOps.Services.UnitTests;

/// <summary>
/// Unit tests for <see cref="HelloWorldService" />.
/// </summary>
public class HelloWorldServiceTests
{
    /// <summary>
    /// Verifies that <see cref="HelloWorldService.SayHello" /> returns the expected greeting.
    /// </summary>
    [Fact]
    public void SayHello_WhenCalled_ShouldReturnHelloWorld()
    {
        // Arrange
        var service = new HelloWorldService();

        // Act
        var result = service.SayHello();

        // Assert
        Assert.Equal("Hello World", result);
    }

    /// <summary>
    /// Verifies that <see cref="HelloWorldService.SayHello" /> returns a non-empty value.
    /// </summary>
    [Fact]
    public void SayHello_WhenCalled_ShouldReturnNonEmptyString()
    {
        // Arrange
        var service = new HelloWorldService();

        // Act
        var result = service.SayHello();

        // Assert
        Assert.False(string.IsNullOrWhiteSpace(result));
    }

    /// <summary>
    /// Verifies that <see cref="HelloWorldService.SayHello" /> returns the same value across calls.
    /// </summary>
    [Fact]
    public void SayHello_WhenCalledMultipleTimes_ShouldReturnSameValue()
    {
        // Arrange
        var service = new HelloWorldService();

        // Act
        var first = service.SayHello();
        var second = service.SayHello();

        // Assert
        Assert.Equal(first, second);
    }

    /// <summary>
    /// Verifies that <see cref="HelloWorldService.SayHello" /> matches the expected output.
    /// </summary>
    /// <param name="expected">The expected greeting.</param>
    [Theory]
    [InlineData("Hello World")]
    public void SayHello_WhenCalled_ShouldMatchExpected(string expected)
    {
        // Arrange
        var service = new HelloWorldService();

        // Act
        var result = service.SayHello();

        // Assert
        Assert.Equal(expected, result);
    }
}
