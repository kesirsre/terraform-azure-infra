variable "env" {}
variable "location" {}
variable "instance_count" { type = number }
variable "nic_ids" {
  type = list(string)
}