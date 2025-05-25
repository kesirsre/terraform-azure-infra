variable "vnet_name" {}
variable "vnet_address_space" {}
variable "location" {}
variable "resource_group_name" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "public_subnet_prefixes" {}
variable "private_subnet_prefixes" {}
variable "tags" {}
variable "bastion_name" {}
variable "public_ip_address_id" {
  description = "public IP address for the Bastion host"  
}
# Add your variable declarations here

variable "public_ip_name" {
  description = "The name of the public IP address."
}
