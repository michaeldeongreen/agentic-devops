// Foundry module: provisions AI Services, Foundry Hub, Foundry Project, and model deployment.
// Keep changes small and environment-agnostic for reuse across dev/test/prod.

locals {
  sanitized_base        = regexreplace(lower(var.foundry_resource_name), "[^a-z0-9]", "")
  ai_services_name      = var.ai_services_name != "" ? var.ai_services_name : substr("ais${local.sanitized_base}", 0, 64)
  storage_account_name  = var.storage_account_name != "" ? var.storage_account_name : substr("st${local.sanitized_base}", 0, 24)
  public_network_access = var.public_network_access ? "Enabled" : "Disabled"
}

resource "azurerm_storage_account" "this" {
  name                     = local.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = var.tags
}

resource "azurerm_ai_services" "this" {
  name                = local.ai_services_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.ai_services_sku_name
  public_network_access = local.public_network_access

  tags = var.tags
}

resource "azurerm_ai_foundry" "this" {
  name                = var.foundry_resource_name
  location            = var.location
  resource_group_name = var.resource_group_name
  storage_account_id  = azurerm_storage_account.this.id
  key_vault_id        = var.key_vault_id
  public_network_access = local.public_network_access

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_ai_foundry_project" "this" {
  name               = var.foundry_project_name
  location           = var.location
  ai_services_hub_id = azurerm_ai_foundry.this.id

  tags = var.tags
}

resource "azurerm_cognitive_deployment" "model" {
  name                 = var.model_deployment_name
  cognitive_account_id = azurerm_ai_services.this.id

  model {
    format  = var.model_format
    name    = var.model_name
    version = var.model_version != "" ? var.model_version : null
  }

  sku {
    name     = var.model_sku_name
    capacity = var.model_tpm_capacity
  }
}
