#for creation of RG
provider "azurerm" {
  features {}

}

module "resource_group" {
  source   = "./module/resource_group"
  name     = var.resource_group_name
  location = var.location
}


#for creation of Vnet
module "virtual_network" {
  source                = "./module/vnet"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  depends_on            = [module.resource_group]
}


#for creation of VM
module "virtual_machines" {
  source              = "./module/vm"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = module.virtual_network.vnet_name
  subnet_name         = module.virtual_network.subnet_name
  vm_name             = "server-${count.index + 1}"
  count               = var.vm_count
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = ""
  image_publisher     = var.image_publisher
  image_offer         = var.image_offer
  image_sku           = var.image_sku
  image_version       = var.image_version
  tags                = var.tags
  depends_on          = [module.virtual_network]
}


#for creation of SQL server and Database
module "sql_server_db" {
  source                         = "./module/sql-server"
  resource_group_name            = module.resource_group.name
  location                       = module.resource_group.location
  sql_server_name                = var.sql_server_name
  sql_server_admin_username      = var.sql_server_admin_username #user your own username  as per requirement
  sql_server_admin_password      = var.sql_server_admin_password # Use a secure password 
  sql_database_name              = var.sql_database_name   #pass the name of databases in variable 
  sql_database_edition           = var.sql_database_edition           # Edition of the database
  sql_database_service_objective = var.sql_database_service_objective # Service objective that matches the edition
  sql_database_max_size_gb       = var.sql_database_max_size_gb       # Max size of the database in GB
  sql_database_collation         = var.sql_database_collation         # Collation setting
  tags                           = var.tags
}