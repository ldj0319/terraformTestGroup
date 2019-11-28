#create azure network security group called "var.name" under resource group called "var.rg"
resource "azurerm_network_security_group" "myNSG" {
        resource_group_name = var.rg
        name                = var.name
        location            = var.location
        tags                = var.tags
}

#Create security rules under security group called "var.name"
#lower number in priorty has higher priority
#"*" means any type
resource "azurerm_network_security_rule" "rule1" {
    name                        = "SSH"
    priority                    = 1001
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = var.rg
    network_security_group_name = var.name
  
}


resource "azurerm_network_security_rule" "rule2" {
    name                        = "RDP"
    priority                    = 1010
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "TCP"
    source_port_range           = "*"
    destination_port_range      = "3389"
    destination_address_prefix  = "*"
    source_address_prefix       = "internet"
    resource_group_name         = var.rg
    network_security_group_name = var.name
  
}


