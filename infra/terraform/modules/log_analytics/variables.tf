// Input variables for the Log Analytics workspace module.

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "SKU for Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "log_analytics_workspace_retention_in_days" {
  description = "Retention in days for Log Analytics workspace."
  type        = number
  default     = 30
}

variable "resource_group_name" {
  description = "Resource group where resources will be created."
  type        = string
}

variable "location" {
  description = "Azure region (e.g., eastus)."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
