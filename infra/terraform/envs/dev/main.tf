// Dev environment root module.
// Keeps environment-specific configuration and calls shared modules.

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  // Backend is configured at init time using pipeline variables.
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

// Resource group already exists; use a data source.
data "azurerm_resource_group" "target" {
  name = var.resource_group_name
}

module "app_service" {
  source = "../../modules/app_service"

  app_service_name       = var.app_service_name
  app_service_plan_name  = var.app_service_plan_name
  app_service_plan_sku_name = var.app_service_plan_sku_name
  app_insights_name      = var.app_insights_name
  resource_group_name    = data.azurerm_resource_group.target.name
  location               = data.azurerm_resource_group.target.location
  dotnet_version         = var.dotnet_version
  always_on              = var.always_on
  tags                   = var.tags
}
