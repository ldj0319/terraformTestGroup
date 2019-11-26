#create resource group called "var.rg_name"
resource "azurerm_resource_group" "rgState" { 
    name = var.rg_name
    location = var.location
    tags = var.tags
} 

#create azure storage account called "var.storage_account_name"
#storage account will be created in state resource group
#if you want to make conatiner as FileStorage accounts, the account tier should be Premium
resource "azurerm_storage_account" "test" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rgState.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

#create azure storage account called "var.container_name"
#container will be located under the storage account called "var.storage_account_name"
#container access type is private (no anonymous access)
#it can be changed to blob (anonymous read access for blobs only) or container (anonymous read access for containers and blobs)
resource "azurerm_storage_container" "test" {
  name                  = var.container_name
  resource_group_name   = azurerm_resource_group.rgState.name
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = "private"
}