resource "azurerm_bastion_host" "my_bastion" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }
}