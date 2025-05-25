env                               = "dev"
location                          = "UK South"
resource_group_name               = "dev"
vnet_name                         = "vnet-dev"
vnet_address_space                = ["10.10.0.0/16"]
public_subnet_prefixes            = ["10.10.1.0/24"]
private_subnet_prefixes           = ["10.10.2.0/24"]
instance_count                    = 2
public_subnet_name                = "dev-public"
private_subnet_name               = "dev-private"
admin_password                    = "Welcome123@"
admin_username                    = "adminuser"
vm_os_type                        = "Windows"
image_publisher                   = "MicrosoftWindowsServer"
image_offer                       = "WindowsServer"
image_sku                         = "2019-Datacenter"
image_version                     = "latest"
nsg_name                          = "nsg-dev"
NetworkInterfaceName              = "dev"
PrivateIPAddressAllocation        = "Dynamic"
backend_pool_id                   = "backendpool"
enable_password_auth              = true
enable_ssh                        = true
vm_size                           = "Standard_B2s"
ResourceGroupLocation             = "UK South"
bastion_name                      = "bastion-vnet-dev"
bastion_public_ip_name            = "bastion-ip-dev"
bastion_public_ip_address_allocation = "Static"
bastion_subnet_name               = "AzureBastionSubnet"
public_ip_address_id              = "pip-dev"
os_disk_encryption                = true

nsg_rules = [
  {
    name                          = "Allow-HTTP"
    priority                      = 101
    direction                     = "Inbound"
    access                        = "Allow"
    protocol                      = "Tcp"
    source_port_range             = "*"
    destination_port_range        = "80"
    source_address_prefix         = "*"
    destination_address_prefix    = "*"
  },
   {
    name                          = "SSH"
    priority                      = 100
    direction                     = "Inbound"
    access                        = "Allow"
    protocol                      = "Tcp"
    source_port_range             = "*"
    destination_port_range        = "22"
    source_address_prefix         = "*"
    destination_address_prefix    = "*"
  } 
]
vm_name                           = "vm-dev"

