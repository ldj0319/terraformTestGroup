#project name
variable "project_name" {
}

#rg name and location
variable "rg_name" {
  description = "Name of the resource group"
}
variable "rg_list" {
}
variable "location" {
  description = "Where to deploy my resources"
  default     = "australiaeast"
}

#Vnet, nsg and route table name
variable "Vnet_name" {
  description = "Name of the virtual network"
}
variable "nsg_name" {
  description = "Name of the network security group"
}
variable "route_table_name" {
}

#tags
variable "tags" {
  description = "tags"
}

#variables for state
variable "state_name" {
}
variable "state_location" {
  description = "Where to deploy my resources"
  default     = "australiaeast"
}
variable "state_tags" {
  description = "tags"
}
variable "storage_account_name" {
}
variable "container_name" {
}
variable "rg_name_state" {
  
}





#variables for vm 1
variable "subnet_name" {
  description = "Name of the subnet"
}
variable "subnet_prefix" {
  
}
variable "network_interface_name" {
  description = "Name of the network interface"
}
variable "virtual_machine_name" {
  
}
variable "public_ip_name" {
  description = "Name of the public ip"
}
variable "ip_config_name" {
  
}
variable "os_disk_name" {
  
}
variable "hostname" {
  
}
variable "username" {
  
}
variable "password" {

}

#variables for vm 2
variable "subnet_name2" {

}
variable "subnet_prefix2" {
  
}
variable "network_interface_name2" {

}
variable "virtual_machine_name2" {
  
}
variable "public_ip_name2" {

}
variable "ip_config_name2" {
  
}
variable "os_disk_name2" {
  
}
variable "hostname2" {
  
}
variable "username2" {
  
}
variable "password2" {

}


