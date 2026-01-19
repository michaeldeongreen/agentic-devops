// Environment-specific variables for dev.

variable "resource_group_name" {
  description = "Existing resource group for dev."
  type        = string
}

variable "app_service_name" {
  description = "Web App name for dev. Must be globally unique."
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

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
