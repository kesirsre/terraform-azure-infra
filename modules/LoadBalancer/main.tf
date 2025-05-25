resource "azurerm_public_ip" "lb_ip" {
  name = "${var.env}-lb-ip"
  location = var.location
  resource_group_name = var.env
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "lb" {
  name = "${var.env}-lb"
  location = var.location
  resource_group_name = var.env
  sku = "Standard"

  frontend_ip_configuration {
    name = "LoadBalancerFrontEnd"
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "bepool" {
  name                = "BackEndPool"
  loadbalancer_id     = azurerm_lb.lb.id
}


resource "azurerm_lb_probe" "health_probe" {
  name                = "Health_check_probe"
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 5
}

resource "azurerm_lb_rule" "lbrule" {
  name                           = "LB-http-rule"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  probe_id                       = azurerm_lb_probe.health_probe.id 
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_assoc" {
  count                    = var.instance_count
  network_interface_id     = var.nic_ids[count.index]
  ip_configuration_name    = "internal"
  backend_address_pool_id  = azurerm_lb_backend_address_pool.bepool.id
}