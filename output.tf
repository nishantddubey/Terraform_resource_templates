# outputs.tf
output "resource_group_name" {
  value = module.resource_group
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = module.virtual_network.vnet_name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = module.virtual_network.subnet_name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = module.virtual_network.vnet_address_space
}

output "subnet_address_prefix" {
  description = "The address prefix of the subnet"
  value       = module.virtual_network.subnet_address_prefix
}


# Output the public IP addresses of all virtual machines
output "public_ip_addresses" {
  description = "The public IP addresses of the virtual machines."
  value       = [for vm in module.virtual_machines : vm.public_ip_address]
}

# Output the SQL Server fully qualified domain name (FQDN)
output "sql_server_fqdn" {
  value = module.sql_server_db.sql_server_fqdn
}

# Output the SQL Database name
output "sql_database_name" {
  value = module.sql_server_db.sql_database_name
}
