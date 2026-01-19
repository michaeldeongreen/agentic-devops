// Input variables for the App Service module.

variable "app_service_name" {
  description = "Name of the Web App. Must be globally unique."
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan."
  type        = string
}

variable "app_service_plan_sku_name" {
  description = "SKU name for the App Service Plan (e.g., B1, P1v3)."
  type        = string
  default     = "B1"
}

variable "app_insights_name" {
  description = "Name of Application Insights resource."
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
