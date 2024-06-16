resource_group_name          = "resource-group-db"
location                     = "East US"
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
