provider "azurerm" {
  features {}
}

# Azure SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_server_admin_username
  administrator_login_password = var.sql_server_admin_password
}

# Azure SQL Database - Create multiple databases dynamically
resource "azurerm_mssql_database" "sql_database" {
  for_each    = var.sql_database_name
  name        = each.key
  server_id   = azurerm_mssql_server.sql_server.id
  collation   = var.sql_database_collation
  max_size_gb = var.sql_database_max_size_gb
  sku_name    = var.sql_database_sku_name

  # Optional settings
  tags = var.tags
}

# Firewall rule to allow Azure services to access the SQL Server
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Firewall rule to whitelist multiple IP addresses to access the SQL Server
resource "azurerm_mssql_firewall_rule" "whitelist_ips" {
  for_each         = var.ip_addresses
  name             = "WhitelistIP-${each.key}"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = each.value
  end_ip_address   = each.value
}

# Output the SQL Server fully qualified domain name (FQDN)
output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

# Output the SQL Database names
output "sql_database_names" {
  value = [for db in azurerm_mssql_database.sql_database : db.name]
}
