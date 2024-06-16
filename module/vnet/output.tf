# outputs.tf
# output "resource_group_name" {
#   description = "The name of the resource group"
#   value       = azurerm_resource_group.
# }

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.example.name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.example.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.example.address_space
}

output "subnet_address_prefix" {
  description = "The address prefix of the subnet"
  value       = azurerm_subnet.example.address_prefixes
}
