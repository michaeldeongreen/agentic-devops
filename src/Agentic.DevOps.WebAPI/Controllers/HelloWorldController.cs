using Agentic.DevOps.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Agentic.DevOps.WebAPI.Controllers;

/// <summary>
/// Provides a hello world endpoint.
/// </summary>
[ApiController]
[Route("api/[controller]")]
public class HelloWorldController : ControllerBase
{
    private readonly IHelloWorldService _helloWorldService;

    /// <summary>
    /// Initializes a new instance of the <see cref="HelloWorldController" /> class.
    /// </summary>
    /// <param name="helloWorldService">The hello world service.</param>
    public HelloWorldController(IHelloWorldService helloWorldService)
    {
        _helloWorldService = helloWorldService;
    }

    /// <summary>
    /// Returns a hello world greeting.
    /// </summary>
    /// <returns>The greeting message.</returns>
    [HttpGet]
    public ActionResult<string> Get()
    {
        return Ok(_helloWorldService.SayHello());
    }
}
