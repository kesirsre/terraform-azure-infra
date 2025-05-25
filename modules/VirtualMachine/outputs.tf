output "vm_ids" {
  value = azurerm_windows_virtual_machine.vm[*].id
}

output "nic_ids" {
  value = [for nic in azurerm_network_interface.vm_nic : nic.id]
}