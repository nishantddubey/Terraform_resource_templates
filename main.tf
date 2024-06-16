#for creation of RG
provider "azurerm" {
  features {}

}

module "resource_group" {
  source = "./module/resource_group"
  name = "resource-group-1"
  location = "East US"
}


#for creation of Vnet
module "virtual_network" {
  source = "./module/vnet"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  vnet_name = "vnet-1"
  vnet_address_space = ["10.0.0.0/16"]
  subnet_name = "subnet-1"
  subnet_address_prefix = ["10.0.0.0/24"]
  depends_on = [ module.resource_group ]
}


#for creation of Vnet
module "virtual_machines" {
  source = "./module/vm"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = module.virtual_network.vnet_name
  subnet_name         = module.virtual_network.subnet_name
  vm_name             = "server-${count.index + 1}"
  count               = 1
  vm_size             = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123"
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "18.04-LTS"
  image_version       = "latest"
  tags = {
    environment = "Production"
  }
depends_on = [ module.virtual_network ]
}


#for creation of SQL server and Database
module "sql_server_db" {
  source = "./module/sql-server"
  resource_group_name          = module.resource_group.name
  location                     = module.resource_group.location
  sql_server_name              = "my-sql-server-nishant"
  sql_server_admin_username    = "dubey"          #user your own username  as per requirement
  sql_server_admin_password    = "YourSecurePassword123!"  # Use a secure password 
  sql_database_name            = "mydatabase"
  sql_database_edition         = "GeneralPurpose"  # Edition of the database
  sql_database_service_objective = "GP_Gen5_2"     # Service objective that matches the edition
  sql_database_max_size_gb     = 5  # Max size of the database in GB
  sql_database_collation       = "SQL_Latin1_General_CP1_CI_AS"  # Collation setting
  tags = {
    environment = "dev"
    team        = "engineering"
  }
}