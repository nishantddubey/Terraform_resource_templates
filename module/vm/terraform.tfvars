resource_group_name = "resource-group-1"
location            = "East US"
vnet_name           = "example-vnet"
subnet_name         = "example-subnet"
vm_name             = "my-vm"
admin_username      = "adminuser"
admin_password      = "P@ssw0rd123"
image_publisher     = "Canonical"
image_offer         = "UbuntuServer"
image_sku           = "18.04-LTS"
image_version       = "latest"
tags = {
  environment = "Production"
}
