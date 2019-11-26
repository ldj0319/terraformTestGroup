resource "azurerm_network_security_group" "myNSG" {
        resource_group_name = var.rg
        name                = var.name
        location            = var.location
        tags                = var.tags
}

resource "azurerm_network_security_rule" "rule3" {
  name                        = "Outbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg
  network_security_group_name = var.name
}


resource "azurerm_network_security_rule" "rule1" {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name         = var.rg
    network_security_group_name = var.name
  
}


resource "azurerm_network_security_rule" "rule2" {
    name                       = "TEST"
    priority                   = 501
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name         = var.rg
    network_security_group_name = var.name
  
}


