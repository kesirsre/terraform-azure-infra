resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

 resource "azurerm_subnet" "public" {
   name                 = var.public_subnet_name
   resource_group_name  = var.resource_group_name
   virtual_network_name = azurerm_virtual_network.vnet.name
   address_prefixes     = var.public_subnet_prefixes
 }

resource "azurerm_subnet" "private" {
  name                 = var.private_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_subnet_prefixes
}

resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                 = "bastionIpConfig"
    subnet_id            = azurerm_subnet.public.id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
  
}