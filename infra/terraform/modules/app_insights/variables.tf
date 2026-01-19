// Input variables for the Application Insights module.

variable "app_insights_name" {
  description = "Name of Application Insights resource."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID for App Insights."
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

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
