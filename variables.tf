# #RG


# #sql-server
# variable "resource_group_name" {
#   description = "The name of the resource group"
# }

# #1
# variable "location" {
#   description = "The location/region where the resource group is created"
# }

# variable "sql_server_name" {
#   description = "The name of the SQL Server"
# }

# variable "sql_server_admin_username" {
#   description = "The administrator username for the SQL Server"
# }

# variable "sql_server_admin_password" {
#   description = "The administrator password for the SQL Server"
#   sensitive   = true
# }

# variable "sql_database_name" {
#   description = "The name of the SQL Database"
# }

# variable "sql_database_edition" {
#   description = "The edition of the SQL Database (e.g., 'Basic', 'Standard', 'Premium', 'GeneralPurpose', 'BusinessCritical')"
#   default     = "GeneralPurpose"
# }

# variable "sql_database_service_objective" {
#   description = "The service objective for the SQL Database (e.g., 'S0', 'P1', 'GP_Gen5_2')"
#   default     = "GP_Gen5_2"
# }

# variable "sql_database_max_size_gb" {
#   description = "The maximum size of the SQL Database in GB"
#   default     = 5
# }

# variable "sql_database_collation" {
#   description = "The collation of the SQL Database"
#   default     = "SQL_Latin1_General_CP1_CI_AS"
# }


# variable "sql_database_sku_name" {
#   description = "e.g. GP_Gen5_2"
#   default     = "GP_Gen5_2"
# }

# variable "ip_addresses" {
#   description = "list the ips which you want to whitelist"
#   type        = map(string)
#   default = {
#     "nishant"  = "<your ip>"
#     "prassana" = "<your ip>"
#     # Add more IP addresses as needed
#   }
# }



# #vm
# #1
# variable "vnet_name" {
#   description = "Azure vnet where you want create your machine"

# }
# #1
# variable "subnet_name" {
#   description = "Azure vnet where you want create your machine"
# }
# #1
# variable "vm_name" {
#   description = "Name of the virtual machine"
# }

# variable "vm_size" {
#   description = "Size of the virtual machine"
#   default     = "Standard_DS1_v2"
# }

# variable "admin_username" {
#   description = "Username for the virtual machine"
# }

# variable "admin_password" {
#   description = "Password for the virtual machine"
# }

# variable "image_publisher" {
#   description = "Publisher of the VM image"
# }

# variable "image_offer" {
#   description = "Offer of the VM image"
# }

# variable "image_sku" {
#   description = "SKU of the VM image"
# }

# variable "image_version" {
#   description = "Version of the VM image"
# }



# #vnet
# # variables.tf


# variable "vnet_address_space" {
#   description = "The address space for the Virtual Network"
#   type        = list(string)
#   default     = ["10.0.0.0/16"]
# }

# variable "subnet_address_prefix" {
#   description = "The address prefix for the Subnet"
#   type        = list(string)
#   default     = ["10.0.1.0/24"]
# }
