#create azure virtual network called "var.Vnetname"
#address will be ["10.0.0.0/16"]
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = var.Vnet_name
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = var.rg
    tags                = var.tags
}

#create azure route table called "var.route_table_name"
#route1 receive "10.1.0.0/16" and send it to vnetlocal
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
