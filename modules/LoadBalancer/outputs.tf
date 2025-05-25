output "lb_public_ip" {
  value = azurerm_public_ip.lb_ip.ip_address
}

output "backend_address_pool_id" {
  #value = azurerm_lb.lb.backend_address_pool[0].id
  value = azurerm_lb_backend_address_pool.bepool.id
}