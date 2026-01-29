using Agentic.DevOps.UI.Components;
using Agentic.DevOps.UI.Services;
using Azure.Core;
using Azure.Identity;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

builder.Services.Configure<FoundryOptions>(
    builder.Configuration.GetSection(FoundryOptions.SectionName));
builder.Services.AddSingleton(sp =>
    sp.GetRequiredService<Microsoft.Extensions.Options.IOptions<FoundryOptions>>().Value);
builder.Services.AddSingleton<TokenCredential, DefaultAzureCredential>();
builder.Services.AddSingleton<FoundryWorkflowClient>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();


app.UseAntiforgery();

app.MapStaticAssets();
app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
