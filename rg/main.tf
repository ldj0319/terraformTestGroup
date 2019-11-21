resource "azurerm_resource_group" "rg" { 
    name = var.rg_name
    location = var.location
    tags = var.tags
} 

resource "azurerm_virtual_network" "test" { 
    name                = var.Vnet_name
    address_space       = ["10.0.0.0/16"] 
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = var.tags
}