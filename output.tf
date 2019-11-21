output "obj_rg" { 
    value = azurerm_resource_group.rg 
} 

output "obj_vnet" { 
    value = azurerm_virtual_network.test 
} 

# output "obj_nsg" { 
#     value = azurerm_network_security_group.test 
# } 