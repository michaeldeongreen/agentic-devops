// Output values for consumers of the module.

output "app_service_url" {
  description = "Default hostname for the Web App."
  value       = azurerm_linux_web_app.this.default_hostname
}

output "app_insights_connection_string" {
  description = "Application Insights connection string."
  value       = azurerm_application_insights.this.connection_string
  sensitive   = true
}
