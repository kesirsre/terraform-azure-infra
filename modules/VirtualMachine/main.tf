
data "azurerm_subnet" "virtualmachinesubnet" {
  name                = var.private_subnet_name
  resource_group_name = var.ResourceGroupName
  virtual_network_name = var.vnet_name
}

resource "azurerm_network_interface" "vm_nic" {
  count = var.instance_count
  name = "${var.NetworkInterfaceName}${count.index}"
  location = var.ResourceGroupLocation
  resource_group_name = var.ResourceGroupName

  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.virtualmachinesubnet.id
    private_ip_address_allocation = "Dynamic"
  }
} 

resource "azurerm_windows_virtual_machine" "vm" {
  count = var.instance_count
  name = "${var.env}-vm-${count.index}"
  location = var.location
  resource_group_name = var.env
  network_interface_ids = [azurerm_network_interface.vm_nic[count.index].id]
  

  admin_username = var.admin_username
  admin_password = var.admin_password
  size = var.vm_size

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}
