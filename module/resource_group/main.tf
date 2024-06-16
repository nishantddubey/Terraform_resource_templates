# Resource Group
resource "azurerm_resource_group" "rg"  {
  name    = var.name
  location = var.location
}



# Outputs to expose the resource group name and location
output "name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}