# Variables

variable "storage_acc_name" {
  type        = string
  description = "The unique name of the storage account"
}

variable "subscription_id" {
  type        = string
  sensitive   = true
  description = "Subscription ID for Terraform to Authenticate with Azure"
}

variable "client_id" {
  type        = string
  sensitive   = true
  description = "Client ID for Terraform to Authenticate with Azure"
}

variable "tenant_id" {
  type        = string
  sensitive   = true
  description = "Tenant ID for Terraform to Authenticate with Azure"
}

variable "resource_group" {
  type        = string
  description = "Name for resource group"
  default     = "hisham-rg"
}