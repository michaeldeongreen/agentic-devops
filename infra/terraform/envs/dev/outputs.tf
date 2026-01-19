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
