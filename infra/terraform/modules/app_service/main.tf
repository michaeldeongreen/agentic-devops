// App Service module: provisions App Service Plan, Web App, and App Insights.
// Keep changes small and environment-agnostic for reuse across dev/test/prod.

locals {
  app_insights_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY        = var.app_insights_instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.app_insights_connection_string
  }
}

resource "azurerm_service_plan" "this" {
  count               = var.create_app_service_plan ? 1 : 0
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku_name

  tags = var.tags
}

locals {
  app_service_plan_id = var.create_app_service_plan ? azurerm_service_plan.this[0].id : var.app_service_plan_id
}


resource "azurerm_linux_web_app" "this" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = local.app_service_plan_id

  site_config {
    always_on        = var.always_on
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }

  app_settings = merge(local.app_insights_settings, var.app_settings)

  tags = var.tags
}
