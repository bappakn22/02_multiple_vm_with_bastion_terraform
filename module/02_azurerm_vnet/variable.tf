variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "location" {
  description = "The location of the virtual network"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  
}

variable "address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}
