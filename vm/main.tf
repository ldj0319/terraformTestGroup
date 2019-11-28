#create subnet under virtual network called "var.Vnet_name"
resource "azurerm_subnet" "subnet" {
    name                 = var.subnet_name
    resource_group_name  = var.rg
    virtual_network_name = var.Vnet_name
    address_prefix       = var.subnet_prefix
}

#create public ip
resource "azurerm_public_ip" "test" {
    name                = var.public_ip_name
    location            = var.location
    resource_group_name = var.rg
    allocation_method   = "Static"
}

#create network interface called "var.network_interface_name" 
#connect network interface to security group, "var.network_security_group.id"
resource "azurerm_network_interface" "test" {
    name                        = var.network_interface_name
    location                    = var.location
    resource_group_name         = var.rg
    network_security_group_id   = var.network_security_group_id

    ip_configuration {
        name                          = var.ip_config_name
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.test.id}"
    }
    tags = var.tags
}

#create virtual machine using network interface id
#Ubuntu 18.04 will be created
#disk called "var.os_disk_name" will be created
#to login to virtual machine, run "ssh var.username@public_ip"
#then enter the password
resource "azurerm_virtual_machine" "main" {
    name                  = var.virtual_machine_name
    location              = var.location
    resource_group_name   = var.rg
    network_interface_ids = ["${azurerm_network_interface.test.id}"]
    vm_size               = "Standard_DS1_v2"

    #delete the OS & data disks automatically when deleting the VM
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }
    storage_os_disk {
        name              = var.os_disk_name
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }
    os_profile {
        computer_name  = var.hostname
        admin_username = var.username
        admin_password = var.password
    }
    os_profile_linux_config {
        disable_password_authentication = false
    }
    tags = var.tags
}
