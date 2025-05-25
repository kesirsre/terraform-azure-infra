variable "env" {}
variable "location" {}
variable "subnet_id" {}
variable "admin_username" {}
variable "admin_password" {}
variable "instance_count" {}
variable "nsg_id" {}
variable "backend_pool_id" {}
variable "vnet_name" {
  type = string
}


variable "ResourceGroupName" {
  description = "resource group name"
}

variable "ResourceGroupLocation" {
  description = "resource group location"
}

variable "PrivateIPAddressAllocation" {
  description = "private IP address allocation method"
}

variable "NetworkInterfaceName" {
  description = "network interface name"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}

variable "image_publisher" {
  description = "Image publisher"  
}

variable "image_offer" {
  description = "Image offer"
}

variable "image_sku" {
  description = "Image SKU"
}

variable "image_version" {
  description = "Image version"
}

variable "vm_size" {
  description = "vm size"
}

