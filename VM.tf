# Create public IPs
#resource "azurerm_public_ip" "public_ip" {
#  name                = var.cwr_public_ip_name
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name
#  allocation_method   = "Static"
#  depends_on          = [azurerm_key_vault_access_policy.des]
#  depends_on          = [azurerm_public_ip.public_ip]

#  tags = {
#    environment = var.environment
#  }
#}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = var.cwr_nfs_ip_name
    subnet_id                     = azurerm_subnet.nfssubnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = var.environment
  }
}

#resource "azurerm_virtual_machine_extension" "vm_extension" {
#  name                 = "VMAccessForLinux"
#  virtual_machine_id   = azurerm_linux_virtual_machine.linuxvm.id
#  publisher            = "Microsoft.OSTCExtensions"
#  type                 = "VMAccessForLinux"
#  type_handler_version = "1.4"
#  settings = <<SETTINGS
#    {
#      "username": "nfsshare1",
#      "password": "aks1234@"
#    }
#SETTINGS
#}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                                 = var.linux_virtual_machine_name
  location                             = azurerm_resource_group.rg.location
  resource_group_name                  = azurerm_resource_group.rg.name
  network_interface_ids                = [azurerm_network_interface.nic.id]
  size                                 = var.cwr_boomi_vm_size
  disable_password_authentication     = false  # Enable password authentication
  admin_username                       = "azureuser"  # Replace with your desired admin username
  admin_password                       = "Pa$$w0rd123"  # Replace with your desired admin password
  allow_extension_operations          = true
  provision_vm_agent                   = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  os_disk {
    name                 = var.cwr_boomi_os_disk
    caching              = var.cwr_boomi_disk_caching
    storage_account_type = var.cwr_boomi_storage_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
  }
}
resource "azurerm_managed_disk" "datadisk" {
  name                 = var.cwr_boomi_data_disk
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.cwr_boomi_storage_type
  create_option        = "Empty"
  disk_size_gb         =  var.cwr_nfsdatadisk_size
}
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk" {
  managed_disk_id    = azurerm_managed_disk.datadisk.id
  virtual_machine_id = azurerm_linux_virtual_machine.linuxvm.id
  lun                = var.cwr_disk_lun
  caching            = var.cwr_boomi_disk_caching
}
