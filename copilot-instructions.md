# Copilot Instructions

## C# Best Practices
- Apply SOLID principles in all designs.
- Prefer small, cohesive classes with clear responsibilities.
- Use dependency injection to decouple implementations.
- Comment all code; keep comments accurate and up to date.
- Use XML documentation comments (///) for classes, methods, properties, and public fields.
- Keep comments focused on intent and behavior; avoid redundant commentary of obvious code.
- Apply least privilege: use the most restrictive access modifiers for classes and members.
- Name interfaces with an `I` prefix (e.g., `IUserService`).
- Keep each interface in its own file.
- Store all interfaces in an `Interfaces` folder.
- When creating a class library, place it in its own folder named after the library.

## Testing Conventions (xUnit)
- Use xUnit for all unit tests.
- Follow Arrange-Act-Assert in each test.
- Use descriptive test names in the format: `Method_WhenCondition_ShouldResult`.

## Azure DevOps Best Practices
- Use YAML pipelines for build and release.
- Keep pipeline stages small and focused.
- Store pipeline templates in a `pipelines` or `azure-pipelines` folder.
- Use variables/variable groups for environment-specific values.
- Enable CI on main branches and PR validation for all changes.
- Publish build artifacts and use them across pipeline stages.
- Keep secrets in Azure Key Vault or secure pipeline variables.
