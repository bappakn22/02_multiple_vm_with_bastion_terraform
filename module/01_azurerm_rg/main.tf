resource "azurerm_resource_group" "my_rg" {
  name     = var.rg_name
  location = var.location
}