# Variables

variable "storage_acc_name" {
  type        = string
  description = "The unique name of the storage account"
}

variable "subscription_id" {
    type = string
    sensitive = true
    description = "Subscription ID for Terraform to Authenticate with Azure"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">4.4.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
  # In version 4 of azurerm, subscription id is mandatory.
  # export ARM_SUBSCRIPTION_ID=00000000-xxxx-xxxx-xxxx-xxxxxxxxxxxx

}

resource "azurerm_storage_account" "terraform_storage_acc" {
  name                     = var.storage_acc_name
  resource_group_name      = "hisham-rg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# TODO: Plan Terraform with GH Actions