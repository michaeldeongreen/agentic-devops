// Environment-specific variables for dev.

variable "resource_group_name" {
  description = "Existing resource group for dev."
  type        = string
}

variable "app_name" {
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

variable "linux_fx_version" {
  description = "Linux runtime stack for the Web App."
  type        = string
  default     = "DOTNETCORE|9.0"
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
