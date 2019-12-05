#provider
#version 1.36.0
provider "azurerm" { 
    version = "1.36.0" 
} 

#create resource group for the other resources (except state)
module "rg" {
    source = "./rg"

    rg_name = var.rg_name
    location = var.location
    tags = var.tags

} 

# create storage account, container and resource group for state
# this should not be changed (do not uncomment the following module unless you want to create everything from begginning)

# module "state" {
#     source = "./state"

#     rg_name = var.rg_name_state
#     storage_account_name = var.storage_account_name
#     container_name = var.container_name
#     location = var.state_location
#     tags = var.state_tags

# }

#network security group module
module "my_nsg_module" {
    source = "./nsg"

    name                = var.nsg_name
    location            = var.location
    rg                  = module.rg.obj_rg.name
    tags                = var.tags
}

#network module
#it will create Vnet and route table
module "my_network" {
    source = "./network"

    Vnet_name               = var.Vnet_name
    route_table_name        = var.route_table_name

    location                = var.location  
    tags                    = var.tags
    rg                      = module.rg.obj_rg.name
}

#vm module
#it will create one virtual machine
module "my_vm" {
    source = "./vm"

    Vnet_name                   = module.my_network.obj_Vnet.name
    subnet_prefix               = var.subnet_prefix
    subnet_name                 = var.subnet_name
    public_ip_name              = var.public_ip_name
    network_interface_name      = var.network_interface_name
    network_security_group_id   = module.my_nsg_module.obj_nsg.id
    virtual_machine_name        = var.virtual_machine_name
    ip_config_name              = var.ip_config_name
    os_disk_name                = var.os_disk_name
    location                    = var.location  
    tags                        = var.tags
    rg                          = module.rg.obj_rg.name

    hostname                    = var.hostname
    username                    = var.username
    password                    = var.password
  
}

#vm module
#it will create another virtual machine
module "my_vm2" {
    source = "./vm"

    Vnet_name                   = module.my_network.obj_Vnet.name
    subnet_prefix               = var.subnet_prefix2
    subnet_name                 = var.subnet_name2
    public_ip_name              = var.public_ip_name2
    network_interface_name      = var.network_interface_name2
    network_security_group_id   = module.my_nsg_module.obj_nsg.id
    virtual_machine_name        = var.virtual_machine_name2
    ip_config_name              = var.ip_config_name2
    os_disk_name                = var.os_disk_name2
    location                    = var.location  
    tags                        = var.tags
    rg                          = module.rg.obj_rg.name

    hostname                    = var.hostname2
    username                    = var.username2
    password                    = var.password2
  
}
