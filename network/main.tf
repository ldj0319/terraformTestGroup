resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = var.Vnet_name
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = var.rg
    tags                = var.tags
}

resource "azurerm_route_table" "test" {
    name                          = var.route_table_name
    location                      = var.location
    resource_group_name           = var.rg
    disable_bgp_route_propagation = false

    route {
        name           = "route1"
        address_prefix = "10.1.0.0/16"
        next_hop_type  = "vnetlocal"
    }
    tags = var.tags
}
