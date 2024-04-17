resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.cwr_nfsnsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_resource_group.rg]

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#resource "azurerm_network_ddos_protection_plan" "ddos" {
 # name                = var.cwr_ddosplan
  #location            = azurerm_resource_group.rg.location
  #resource_group_name = azurerm_resource_group.rg.name
  #depends_on          = [azurerm_network_security_group.nsg]
#}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.cwr_address_space
  #dns_servers        = ["10.0.0.4", "10.0.0.5"]
  depends_on          = [azurerm_network_security_group.nsg]

  #ddos_protection_plan {
   # id     = azurerm_network_ddos_protection_plan.ddos.id
   # enable = true
  #}
  tags = {
    environment = var.environment
  }
}
resource "azurerm_subnet" "akssubnet" {
  name                 = var.cwr_aks_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.cwr_aks_subnet
  enforce_private_link_endpoint_network_policies  = "true"
  depends_on           = [azurerm_virtual_network.virtual_network]
}
resource "azurerm_subnet" "nfssubnet" {
  name                 = var.cwr_vnode_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.cwr_vnode_subnet
  enforce_private_link_endpoint_network_policies  = "true"
  depends_on           = [azurerm_subnet.akssubnet]
}