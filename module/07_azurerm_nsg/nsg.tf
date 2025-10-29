resource "azurerm_network_security_group" "vm_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}