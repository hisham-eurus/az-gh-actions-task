terraform {
  backend "azurerm" {
    resource_group_name  = "hisham-rg"
    storage_account_name = "tfstatestorage131025"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
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
  subscription_id = var.subscription_id
}