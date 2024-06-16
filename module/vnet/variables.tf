# variables.tf
variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "location" {
  description = "The location of the resource group"
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "example-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
  default     = "example-subnet"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
