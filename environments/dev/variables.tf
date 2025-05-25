variable "location" {
    description = "resource group location"
}
variable "resource_group_name" {}
variable "vnet_name" {}
variable "vnet_address_space" { type = list(string) }
variable "public_subnet_prefixes" { type = list(string) }
variable "private_subnet_prefixes" { type = list(string) }
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "nsg_name" {}
variable "nsg_rules" { type = list(any) }
variable "vm_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "instance_count" { type = number }
variable "env" {}

variable "admin_password" {
  description = "Admin password for the VM"
}

variable "vm_os_type" {
  description = "Operating system type"
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

variable "backend_pool_id" {}

variable "enable_ssh" {
  description = "Enable SSH access"
}

variable "enable_password_auth" {
  description = "Enable password authentication"
}

variable "NetworkInterfaceName" {
  description = "network interface name"
}

variable "PrivateIPAddressAllocation" {
  description = "private IP address allocation "
}

variable "ResourceGroupLocation" {
  description = "resource group location"
}

variable "bastion_name" {
  description = "bastion host name"
}

variable "bastion_public_ip_name" {
  description = "bastion public IP name"
}

variable "bastion_subnet_name" {
  description = "bastion subnet name"
}
  
variable "bastion_public_ip_address_allocation" {
  description = "bastion public IP address allocation"
}

variable "public_ip_address_id" {
  description = "The name of the public IP address."
}