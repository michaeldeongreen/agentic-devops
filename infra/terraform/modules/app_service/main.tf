// App Service module: provisions App Service Plan, Web App, and App Insights.
// Keep changes small and environment-agnostic for reuse across dev/test/prod.

resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku_name

  tags = var.tags
}


resource "azurerm_linux_web_app" "this" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {
    always_on        = var.always_on
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY        = var.app_insights_instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.app_insights_connection_string
  }

  tags = var.tags
}
