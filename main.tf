# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
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

  features {}
  # In version 4 of azurerm, subscription id is mandatory.
  # export ARM_SUBSCRIPTION_ID=00000000-xxxx-xxxx-xxxx-xxxxxxxxxxxx

}

# Variables

# variable "storage_acc_name" {
#   type        = string
#   description = "The unique name of the storage account"
# }

# Create a resource group
resource "azurerm_resource_group" "hisham_rg" {
  name     = "hisham-rg"
  location = "East US"
}

resource "azurerm_storage_account" "terraform_storage_acc" {
  name                     = "ghactionsstorageacc1234"
  resource_group_name      = azurerm_resource_group.hisham_rg.name
  location                 = azurerm_resource_group.hisham_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "data_container" {
  name                  = "data"
  storage_account_id    = azurerm_storage_account.terraform_storage_acc.id
  container_access_type = "blob"
  depends_on            = [azurerm_storage_account.terraform_storage_acc]
}
