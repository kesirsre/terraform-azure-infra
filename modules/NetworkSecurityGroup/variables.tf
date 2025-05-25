variable "nsg_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_ids" {
  description = "subnet IDs to associate with the Network Security Group"
  type        = string
  default     = ""
}
variable "tags" {
  type = map(string)
}
variable "subnet_id" {}
variable "security_rules" {
  description = "List of security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}