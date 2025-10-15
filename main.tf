
resource "azurerm_storage_account" "terraform_storage_acc" {
  name                     = var.storage_acc_name
  resource_group_name      = "hisham-rg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
