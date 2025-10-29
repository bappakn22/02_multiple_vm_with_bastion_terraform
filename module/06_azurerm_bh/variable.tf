variable "bastion_name" {
  description = "The name of the bastion host"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string  
  
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type        = string  
  
}