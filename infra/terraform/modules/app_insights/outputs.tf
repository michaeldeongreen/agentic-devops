// Output values for consumers of the module.

output "instrumentation_key" {
  description = "Instrumentation key for Application Insights."
  value       = azurerm_application_insights.this.instrumentation_key
  sensitive   = true
}

output "connection_string" {
  description = "Connection string for Application Insights."
  value       = azurerm_application_insights.this.connection_string
  sensitive   = true
}
