// Output values for consumers of the module.

output "app_service_url" {
  description = "Default hostname for the Web App."
  value       = azurerm_linux_web_app.this.default_hostname
}
