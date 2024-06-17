#RG
resource_group_name = "resource-group-1"
location            = "East US"

#Vnet
vnet_name   = "example-vnet"
subnet_name = "example-subnet"

#VM
vm_name         = "my-vm"
vm_count        = 1
admin_username  = "adminuser"
image_publisher = "Canonical"
image_offer     = "UbuntuServer"
image_sku       = "18.04-LTS"
image_version   = "latest"


#SQL-server
sql_server_name                = "my-sql-server-nishant"
sql_server_admin_username      = "dubey"                        #user your own username  as per requirement
sql_server_admin_password      = "nishant@123!"                 # Use a secure password 
sql_database_name              = ["db1", "db2", "dd3"]          #provide of the name of databases as many you want
sql_database_edition           = "GeneralPurpose"               # Edition of the database
sql_database_service_objective = "GP_Gen5_2"                    # Service objective that matches the edition
sql_database_max_size_gb       = 5                              # Max size of the database in GB
sql_database_collation         = "SQL_Latin1_General_CP1_CI_AS" # Collation setting


#tags
tags = {
  environment = "Production"
  project     = "MyProject"
  owner       = "team@example.com"
}