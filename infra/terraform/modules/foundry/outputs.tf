// Output values for consumers of the module.

output "ai_services_id" {
  description = "AI Services account ID."
  value       = azurerm_ai_services.this.id
}

output "ai_services_endpoint" {
  description = "AI Services endpoint."
  value       = azurerm_ai_services.this.endpoint
}

output "foundry_hub_id" {
  description = "AI Foundry Hub ID."
  value       = azurerm_ai_foundry.this.id
}

output "foundry_project_id" {
  description = "AI Foundry Project ID."
  value       = azurerm_ai_foundry_project.this.id
}

output "model_deployment_name" {
  description = "Model deployment name."
  value       = azurerm_cognitive_deployment.model.name
}
