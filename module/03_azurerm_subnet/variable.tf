variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}
variable "rg_name" {
  description = "The name of the resource group"
  type        = string  
}
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}