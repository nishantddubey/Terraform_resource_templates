# ssh-key.tf
# Generate SSH key pair locally using the TLS provider
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096  # Optional: specify the key length
}

# Save the private key to a local file with secure permissions
resource "local_file" "ssh_private_key" {
  content        = tls_private_key.ssh_key.private_key_pem
  filename       = "${path.root}/keypairs/id_rsa.pem"
  file_permission = "0600"  # Ensure secure permissions for the private key file
}

# Save the public key to a local file
resource "local_file" "ssh_public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh
  filename = "${path.root}/keypairs/d_rsa.pub"
}

# main.tf
# Data source to reference an existing virtual network
data "azurerm_virtual_network" "default" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

# Data source to reference an existing subnet
data "azurerm_subnet" "default" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.default.name
  resource_group_name  = var.resource_group_name
}

# Network Security Group (NSG) to allow SSH access
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.vm_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Public IP Address for the VM
resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.vm_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"  # Set to Static to ensure immediate availability
}

# Network Interface for the VM
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
}

# Virtual Machine Configuration
resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  count                 = 1
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic.id]
  delete_os_disk_on_termination = true  #if you dont want to delete disk then value should be "false"

  # OS Disk configuration
  storage_os_disk {

    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  

  

  # OS Profile for Linux VM
  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
  }

  # OS Profile Linux Configuration
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = tls_private_key.ssh_key.public_key_openssh
    
    }
  }

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = var.tags
  # Explicitly wait for public IP to be ready before VM creation
  depends_on = [azurerm_public_ip.vm_public_ip]
}

# outputs.tf
# Output the Public IP Address of the VM
output "public_ip_address" {
  value       = azurerm_public_ip.vm_public_ip.ip_address
  description = "The public IP address of the virtual machine."
  depends_on  = [azurerm_virtual_machine.vm]  # Ensure this output waits for the VM creation
}
