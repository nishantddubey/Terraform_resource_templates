#RG  (we will use same  resource group for all resources by default)
variable "resource_group_name" {
  description = "The name of the resource group"
}


#sql-server

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


# Provide the name of  databases that  you required like ["db1","db2","d3"]
variable "sql_database_name" {
  description = "The name of the SQL Database"
  type        = set(string)
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


variable "sql_database_sku_name" {
  description = "e.g. GP_Gen5_2"
  default     = "GP_Gen5_2"
}

variable "ip_addresses" {
  description = "list the ips which you want to whitelist"
  type        = map(string)
  default = {
    "nishant"  = "<your ip>"
    "prassana" = "<your ip>"
    # Add more IP addresses as needed
  }
}



#vnet
# variables.tf
variable "vnet_name" {
  description = "Azure vnet where you want create your machine"

}

variable "subnet_name" {
  description = "Azure vnet where you want create your machine"
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "The address prefix for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}


#vm
variable "vm_name" {
  description = "Name of the virtual machine"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_DS1_v2"
}
variable "vm_count" {
  description = "Number of Virtual machine you required"
  default     = 1
}

variable "admin_username" {
  default     = "adminuser"
  description = "Username for the virtual machine"
}

# variable "admin_password" {
#   description = "Password for the virtual machine"
#   sensitive = true
# }

variable "image_publisher" {
  description = "Publisher of the VM image"
}

variable "image_offer" {
  description = "Offer of the VM image"
}

variable "image_sku" {
  description = "SKU of the VM image"
}

variable "image_version" {
  description = "Version of the VM image"
}

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)
  default     = {} # Default to an empty map if no tags are provided
}
