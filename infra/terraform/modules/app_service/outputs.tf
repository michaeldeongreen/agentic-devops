// Output values for consumers of the module.

output "app_service_url" {
  description = "Default hostname for the Web App."
  value       = azurerm_linux_web_app.this.default_hostname
}

output "app_service_plan_id" {
  description = "App Service Plan ID used by this module."
  value       = local.app_service_plan_id
}

output "principal_id" {
  description = "Principal ID for the system-assigned managed identity (if enabled)."
  value       = try(azurerm_linux_web_app.this.identity[0].principal_id, null)
}
