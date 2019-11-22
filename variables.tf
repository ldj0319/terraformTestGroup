variable "location" {
  description = "Where to deploy my resources"
  default     = "australiaeast"
}

variable "state_location" {
  description = "Where to deploy my resources"
  default     = "australiaeast"
}

variable "rg_name" {
  description = "Name of the resource group"
}

variable "Vnet_name" {
  description = "Name of the virtual network"
}

variable "nsg_name" {
  description = "Name of the network security group"
}

variable "subnet_name" {
  description = "Name of the subnet"
}

variable "public_ip_name" {
  description = "Name of the public ip"
}

variable "network_interface_name" {
  description = "Name of the network interface"
}

variable "tags" {
  description = "tags"
}

variable "state_tags" {
  description = "tags"
}

variable "prefix" {
}

variable "rg_list" {
}

variable "storage_account_name" {
}

variable "container_name" {
}

variable "state_name" {
}

variable "rg_name_state" {
  
}

variable "project_name" {
}

