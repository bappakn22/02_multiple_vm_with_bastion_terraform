data "azurerm_key_vault" "my_kv" {
  name                = "mtijori"
  resource_group_name = "bappa-state-rg"
}

data "azurerm_key_vault_secret" "kv_usec" {
  name         = "tuser"
  key_vault_id = data.azurerm_key_vault.my_kv.id
}
data "azurerm_key_vault_secret" "kv_psec" {
  name         = "tpass"
  key_vault_id = data.azurerm_key_vault.my_kv.id
}

data "azurerm_public_ip" "pipdata" {
  depends_on = [ module.pip ]
  name                = "vivopip"
  resource_group_name = "mybastion_rg"
}

output "public_ip_address" {
  value = data.azurerm_public_ip.pipdata.id
}

data "azurerm_subnet" "subdata" {
  depends_on = [ module.bastion_subnet ]
  name                 = "AzureBastionSubnet"
  virtual_network_name = "oppo-vnet"
  resource_group_name  = "mybastion_rg"
}

output "subnet_id" {
  value = data.azurerm_subnet.subdata.id
}

data "azurerm_subnet" "subvmdata" {
  depends_on = [ module.vm_subnet ]
  name                 = "vm-subnet"
  virtual_network_name = "oppo-vnet"
  resource_group_name  = "mybastion_rg"
}
