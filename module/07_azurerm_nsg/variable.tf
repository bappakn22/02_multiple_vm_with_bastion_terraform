variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet to associate with the NSG"
  type        = string
  
}