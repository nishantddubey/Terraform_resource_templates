variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The location/region where the resource group is created"
}

variable "sql_server_name" {
  description = "The name of the SQL Server"
}

variable "sql_server_admin_username" {
  description = "The administrator username for the SQL Server"
}

variable "sql_server_admin_password" {
  description = "The administrator password for the SQL Server"
  sensitive   = true
}


variable "sql_database_edition" {
  description = "The edition of the SQL Database (e.g., 'Basic', 'Standard', 'Premium', 'GeneralPurpose', 'BusinessCritical')"
  default     = "GeneralPurpose"
}

variable "sql_database_service_objective" {
  description = "The service objective for the SQL Database (e.g., 'S0', 'P1', 'GP_Gen5_2')"
  default     = "GP_Gen5_2"
}

variable "sql_database_max_size_gb" {
  description = "The maximum size of the SQL Database in GB"
  default     = 5
}

variable "sql_database_collation" {
  description = "The collation of the SQL Database"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "sql_database_sku_name" {
  description = "e.g. GP_Gen5_2"
  default     = "GP_Gen5_2"
}

variable "ip_addresses" {
  description = "list the ips which you want to whitelist"
  type        = map(string)
  default = {
    "nishant" = "49.204.77.222"
    "room"    = "115.99.233.0"
    # Add more IP addresses as needed
  }
}
# Provide the name of  databases that  you required like ["db1","db2","d3"]
variable "sql_database_name" {
  description = "List of names for the SQL databases"
  type        = set(string)
}