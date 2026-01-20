// Outputs for the dev environment.

output "app_service_url" {
  description = "Default hostname for the Web App."
  value       = module.app_service.app_service_url
}

output "app_service_ui_url" {
  description = "Default hostname for the UI Web App."
  value       = module.app_service_ui.app_service_url
}

output "app_service_ui_principal_id" {
  description = "Principal ID for the UI managed identity."
  value       = module.app_service_ui.principal_id
}

output "key_vault_uri" {
  description = "Key Vault URI for dev."
  value       = module.key_vault.vault_uri
}

output "foundry_hub_id" {
  description = "AI Foundry Hub ID."
  value       = module.foundry.foundry_hub_id
}

output "foundry_project_id" {
  description = "AI Foundry Project ID."
  value       = module.foundry.foundry_project_id
}

output "foundry_ai_services_endpoint" {
  description = "AI Services endpoint for Foundry."
  value       = module.foundry.ai_services_endpoint
}

output "foundry_model_deployment_name" {
  description = "Deployed model name for Foundry."
  value       = module.foundry.model_deployment_name
}
