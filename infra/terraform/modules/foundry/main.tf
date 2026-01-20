// Foundry module: provisions AI Services, Foundry Hub, Foundry Project, and model deployment.
// Keep changes small and environment-agnostic for reuse across dev/test/prod.

locals {
  sanitized_base              = replace(lower(var.foundry_resource_name), "[^a-z0-9]", "")
  ai_services_name            = var.ai_services_name != "" ? var.ai_services_name : substr("ais${local.sanitized_base}", 0, 64)
  public_network_access       = var.public_network_access ? "Enabled" : "Disabled"
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
  storage_account_id  = var.storage_account_id
  key_vault_id        = var.key_vault_id
  public_network_access = local.public_network_access

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "foundry_storage_blob_contributor" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_ai_foundry.this.identity[0].principal_id
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
