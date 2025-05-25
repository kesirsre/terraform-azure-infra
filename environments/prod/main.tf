locals {
  common_tags = {
    environment = "var.env"
  }
}

module "VirtualNetwork" {
  source                      = "../../modules/VirtualNetwork"
  vnet_name                   = var.vnet_name
  vnet_address_space          = var.vnet_address_space
  public_subnet_name          = var.public_subnet_name
  public_subnet_prefixes      = var.public_subnet_prefixes
  private_subnet_name         = var.private_subnet_name
  private_subnet_prefixes     = var.private_subnet_prefixes
  location                    = var.location
  resource_group_name         = var.resource_group_name
  bastion_name                = var.bastion_name
  public_ip_name              = var.bastion_public_ip_name
  public_ip_address_id        = var.public_ip_address_id
  tags                        = local.common_tags
}

module "NetworkSecurityGroup" {
  source                        = "../../modules/NetworkSecurityGroup"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  security_rules                = var.nsg_rules
  tags                          = local.common_tags
  nsg_name                      = var.nsg_name
  subnet_id                     = module.VirtualNetwork.private_subnet_id
  depends_on                    = [ module.VirtualNetwork ]
}

module "VirtualMachine" {
  source                        = "../../modules/VirtualMachine"
  subnet_id                     = module.VirtualNetwork.private_subnet_id
  backend_pool_id               = var.backend_pool_id
  instance_count                = var.instance_count
  NetworkInterfaceName          = var.NetworkInterfaceName
  nsg_id                        = module.NetworkSecurityGroup.nsg_id
  env                           = var.env
  admin_username                = var.admin_username
  admin_password                = var.admin_password
  location                      = var.location
  private_subnet_name           = var.private_subnet_name
  vnet_name                     = var.vnet_name
  ResourceGroupName             = var.resource_group_name
  PrivateIPAddressAllocation    = var.PrivateIPAddressAllocation
  ResourceGroupLocation         = var.ResourceGroupLocation
  image_sku                     = var.image_sku
  image_offer                   = var.image_offer
  image_publisher               = var.image_publisher
  image_version                 = var.image_version
  vm_size                       = var.vm_size
  depends_on = [ module.NetworkSecurityGroup, module.VirtualNetwork ]
}


module "LoadBalancer" {
 source                        = "../../modules/lb"
 env                           = var.env
 instance_count                = var.instance_count
 location                      = var.location
 nic_ids                       = module.VirtualMachine.nic_ids
 depends_on                    = [ module.NetworkSecurityGroup, module.VirtualMachine, module.VirtualNetwork ]
}