// Outputs for the dev environment.

output "app_service_url" {
  description = "Default hostname for the Web App."
  value       = module.app_service.app_service_url
}
