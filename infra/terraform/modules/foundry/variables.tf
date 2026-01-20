// Input variables for the Foundry module.

variable "foundry_resource_name" {
  description = "Name of the AI Foundry Hub."
  type        = string
}

variable "foundry_project_name" {
  description = "Name of the AI Foundry Project."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where resources will be created."
  type        = string
}

variable "location" {
  description = "Azure region (e.g., eastus)."
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID used by the AI Foundry Hub."
  type        = string
}

variable "ai_services_name" {
  description = "Optional override for the AI Services account name."
  type        = string
  default     = ""
}

variable "ai_services_sku_name" {
  description = "SKU name for the AI Services account (e.g., S0)."
  type        = string
  default     = "S0"
}

variable "storage_account_name" {
  description = "Optional override for the storage account name used by Foundry."
  type        = string
  default     = ""
}

variable "model_name" {
  description = "Model name to deploy."
  type        = string
  default     = "gpt-4o-mini"
}

variable "model_format" {
  description = "Model format for the deployment."
  type        = string
  default     = "OpenAI"
}

variable "model_version" {
  description = "Optional model version. Use empty string to pick the default version."
  type        = string
  default     = ""
}

variable "model_deployment_name" {
  description = "Deployment name for the model."
  type        = string
  default     = "gpt-4o-mini"
}

variable "model_sku_name" {
  description = "SKU name for the model deployment."
  type        = string
  default     = "Standard"
}

variable "model_tpm_capacity" {
  description = "Tokens-per-minute capacity in thousands (e.g., 10 = 10k TPM)."
  type        = number
  default     = 10
}

variable "public_network_access" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
