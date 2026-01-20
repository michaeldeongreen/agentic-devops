// Environment-specific variables for dev.

variable "resource_group_name" {
  description = "Existing resource group for dev."
  type        = string
}

variable "app_service_name" {
  description = "Web App name for dev. Must be globally unique."
  type        = string
}

variable "app_service_name_ui" {
  description = "UI Web App name for dev. Must be globally unique."
  type        = string
}

variable "app_service_plan_name" {
  description = "App Service Plan name for dev."
  type        = string
}

variable "app_service_plan_sku_name" {
  description = "SKU name for the App Service Plan (e.g., B1, P1v3)."
  type        = string
  default     = "B1"
}

variable "app_insights_name" {
  description = "App Insights name for dev."
  type        = string
}

variable "key_vault_name" {
  description = "Key Vault name for dev. Must be globally unique."
  type        = string
}

variable "foundry_resource_name" {
  description = "AI Foundry Hub name for dev."
  type        = string
}

variable "foundry_project_name" {
  description = "AI Foundry Project name for dev."
  type        = string
}

variable "foundry_ai_services_name" {
  description = "Optional override for the AI Services account name."
  type        = string
  default     = ""
}

variable "foundry_storage_account_name" {
  description = "Optional override for the Foundry storage account name."
  type        = string
  default     = ""
}

variable "foundry_model_name" {
  description = "Model name to deploy."
  type        = string
  default     = "gpt-4o-mini"
}

variable "foundry_model_format" {
  description = "Model format for the deployment."
  type        = string
  default     = "OpenAI"
}

variable "foundry_model_version" {
  description = "Optional model version. Use empty string to pick the default version."
  type        = string
  default     = ""
}

variable "foundry_model_deployment_name" {
  description = "Deployment name for the model."
  type        = string
  default     = "gpt-4o-mini"
}

variable "foundry_model_sku_name" {
  description = "SKU name for the model deployment."
  type        = string
  default     = "Standard"
}

variable "foundry_model_tpm_capacity" {
  description = "Tokens-per-minute capacity in thousands (e.g., 10 = 10k TPM)."
  type        = number
  default     = 10
}

variable "foundry_public_network_access" {
  description = "Whether public network access is enabled for Foundry resources."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics workspace name for dev."
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "Log Analytics workspace SKU for dev."
  type        = string
  default     = "PerGB2018"
}

variable "log_analytics_workspace_retention_in_days" {
  description = "Log Analytics workspace retention in days for dev."
  type        = number
  default     = 30
}

variable "dotnet_version" {
  description = "Dotnet runtime version for the Linux Web App (e.g., 9.0)."
  type        = string
  default     = "9.0"
}

variable "always_on" {
  description = "Keep the app always on."
  type        = bool
  default     = true
}

variable "ui_app_settings" {
  description = "Additional app settings for the UI app."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
