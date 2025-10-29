module "rg" {
  source   = "../module/01_azurerm_rg"
  rg_name  = "mybastion_rg"
  location = "japan east"
}

module "vnet" {
  depends_on    = [module.rg]
  source        = "../module/02_azurerm_vnet"
  vnet_name     = "oppo-vnet"
  location      = "japan east"
  rg_name       = "mybastion_rg"
  address_space = ["10.0.0.0/16"]
}

module "vm_subnet" {
  depends_on       = [module.vnet]
  source           = "../module/03_azurerm_subnet"
  subnet_name      = "vm-subnet"
  rg_name          = "mybastion_rg"
  vnet_name        = "oppo-vnet"
  address_prefixes = ["10.0.1.0/24"]
}

module "bastion_subnet" {
  depends_on       = [module.vnet]
  source           = "../module/03_azurerm_subnet"
  subnet_name      = "AzureBastionSubnet"
  rg_name          = "mybastion_rg"
  vnet_name        = "oppo-vnet"
  address_prefixes = ["10.0.2.0/24"]
}

module "pip" {
  depends_on     = [module.rg]
  source         = "../module/04_azurerm_public_ip"
  public_ip_name = "vivopip"
  location       = "japan east"
  rg_name        = "mybastion_rg"
}

module "frontend_vm" {
  depends_on     = [module.rg, module.vnet]
  source         = "../module/05_azurerm_vm"
  vm_name        = "bastion-frontendvm"
  rg_name        = "mybastion_rg"
  location       = "japan east"
  vm_size        = "Standard_B1s"
  admin_username = data.azurerm_key_vault_secret.kv_usec.value
  admin_password = data.azurerm_key_vault_secret.kv_psec.value
  nic_name       = "mynokianicfront"
  subnet_id      = data.azurerm_subnet.subvmdata.id
}

module "backend_vm" {
  depends_on     = [module.rg, module.vnet]
  source         = "../module/05_azurerm_vm"
  vm_name        = "bastion-backendvm"
  rg_name        = "mybastion_rg"
  location       = "japan east"
  vm_size        = "Standard_B1s"
  admin_username = data.azurerm_key_vault_secret.kv_usec.value
  admin_password = data.azurerm_key_vault_secret.kv_psec.value
  nic_name       = "mynokianicback"
  subnet_id      = data.azurerm_subnet.subvmdata.id
}

module "bastion_host" {
  depends_on            = [module.pip]
  source                = "../module/06_azurerm_bh"
  bastion_name          = "mybastionhost"
  rg_name               = "mybastion_rg"
  location              = "japan east"
  ip_configuration_name = "bst_ip"
  public_ip_address_id  = data.azurerm_public_ip.pipdata.id
  subnet_id             = data.azurerm_subnet.subdata.id
}

module "nsg" {
  depends_on = [module.vm_subnet]
  source     = "../module/07_azurerm_nsg"
  rg_name    = "mybastion_rg"
  location   = "japan east"
  nsg_name   = "vm-nsg"
  subnet_id  = data.azurerm_subnet.subvmdata.id
}