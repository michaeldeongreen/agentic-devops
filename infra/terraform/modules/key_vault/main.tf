// Key Vault module: provisions an Azure Key Vault for secrets.
// Keep changes small and environment-agnostic for reuse across dev/test/prod.

data "azurerm_client_config" "current" {}

locals {
  key_vault_sanitized = replace(lower(var.key_vault_name), "[^a-z0-9-]", "")
  key_vault_truncated = substr(local.key_vault_sanitized, 0, 24)
  key_vault_name      = length(local.key_vault_truncated) < 3 ? substr("kv${local.key_vault_truncated}", 0, 24) : local.key_vault_truncated
}

resource "azurerm_key_vault" "this" {
  name                = local.key_vault_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = var.sku_name

  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}
