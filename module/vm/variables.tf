variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region where resources will be created"
  default     = "East US"
}
variable "vnet_name" {
  description = "Azure vnet where you want create your machine"
  
}

variable "subnet_name" {
  description = "Azure vnet where you want create your machine"
}
variable "vm_name" {
  description = "Name of the virtual machine"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Username for the virtual machine"
}

variable "admin_password" {
  description = "Password for the virtual machine"
}

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
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
