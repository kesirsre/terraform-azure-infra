variable "location" {
    description = "resource group location"
}

variable "resource_group_name" {
  description = "resource group name"
}

variable "vnet_name" {
  description = "Virtual Network name"
}

variable "vnet_address_space" {
  description = "Virtual Network address space" 
  type = list(string) 
}

variable "public_subnet_prefixes" { 
  description = "Public subnet prefixes"
  type = list(string) 
}

variable "private_subnet_prefixes" { 
  description = "Private subnet prefixes"
  type = list(string) 
}

variable "public_subnet_name" {
  description = "Public subnet name"
}

variable "private_subnet_name" {
  description = "Private subnet name"
}

variable "nsg_name" {
  description = "Network Security Group name"
}

variable "nsg_rules" { 
  description = "network security group rules"
  type = list(any) 
}

variable "vm_name" {
  description = "virtual machine name"
}

variable "vm_size" {
  description = "size of the virtual machine"
}

variable "admin_username" {
  description = "Admin username"
}

variable "instance_count" { 
  description = "instance count for the virtual machine"
}

variable "env" {
  description = "Environment name"
}

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