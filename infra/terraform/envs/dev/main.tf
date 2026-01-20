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
  features {
    storage {
      data_plane_available = false
    }
  }
}

// Resource group already exists; use a data source.
data "azurerm_resource_group" "target" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "foundry" {
  name                = var.foundry_storage_account_name
  resource_group_name = data.azurerm_resource_group.target.name
}

module "app_service" {
  source = "../../modules/app_service"

  app_service_name       = var.app_service_name
  app_service_plan_name  = var.app_service_plan_name
  app_service_plan_sku_name = var.app_service_plan_sku_name
  create_app_service_plan = true
  app_insights_instrumentation_key = module.app_insights.instrumentation_key
  app_insights_connection_string   = module.app_insights.connection_string
  resource_group_name    = data.azurerm_resource_group.target.name
  location               = data.azurerm_resource_group.target.location
  dotnet_version         = var.dotnet_version
  always_on              = var.always_on
  tags                   = var.tags
}

module "app_service_ui" {
  source = "../../modules/app_service"

  app_service_name       = var.app_service_name_ui
  app_service_plan_name  = var.app_service_plan_name
  app_service_plan_sku_name = var.app_service_plan_sku_name
  create_app_service_plan = false
  app_service_plan_id     = module.app_service.app_service_plan_id
  app_insights_instrumentation_key = module.app_insights.instrumentation_key
  app_insights_connection_string   = module.app_insights.connection_string
  resource_group_name    = data.azurerm_resource_group.target.name
  location               = data.azurerm_resource_group.target.location
  dotnet_version         = var.dotnet_version
  always_on              = var.always_on
  enable_system_assigned_identity = true
  app_settings           = merge(var.ui_app_settings, { "APP_ROLE" = "ui" })
  tags                   = var.tags
}

module "log_analytics" {
  source = "../../modules/log_analytics"

  log_analytics_workspace_name = var.log_analytics_workspace_name
  log_analytics_workspace_sku  = var.log_analytics_workspace_sku
  log_analytics_workspace_retention_in_days = var.log_analytics_workspace_retention_in_days
  resource_group_name = data.azurerm_resource_group.target.name
  location            = data.azurerm_resource_group.target.location
  tags                = var.tags
}

module "app_insights" {
  source = "../../modules/app_insights"

  app_insights_name          = var.app_insights_name
  log_analytics_workspace_id = module.log_analytics.id
  resource_group_name        = data.azurerm_resource_group.target.name
  location                   = data.azurerm_resource_group.target.location
  tags                       = var.tags
}

module "key_vault" {
  source = "../../modules/key_vault"

  key_vault_name     = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.target.name
  location            = data.azurerm_resource_group.target.location
  tags                = var.tags
}

module "foundry" {
  source = "../../modules/foundry"

  foundry_resource_name     = var.foundry_resource_name
  foundry_project_name      = var.foundry_project_name
  ai_services_name          = var.foundry_ai_services_name
  storage_account_id        = data.azurerm_storage_account.foundry.id
  model_name                = var.foundry_model_name
  model_format              = var.foundry_model_format
  model_version             = var.foundry_model_version
  model_deployment_name     = var.foundry_model_deployment_name
  model_sku_name            = var.foundry_model_sku_name
  model_tpm_capacity        = var.foundry_model_tpm_capacity
  public_network_access     = var.foundry_public_network_access
  create_storage_role_assignment = var.foundry_create_storage_role_assignment
  key_vault_id              = module.key_vault.id
  resource_group_name       = data.azurerm_resource_group.target.name
  location                  = data.azurerm_resource_group.target.location
  tags                      = var.tags
}
