#data "azurerm_subscription" "primary" {}
resource "azurerm_kubernetes_cluster" "dev1" {
  name                             = var.cwr_cluster_name
  kubernetes_version               = var.kubernetes_version
  location                         = var.location
  resource_group_name              = azurerm_resource_group.rg.name
  private_cluster_enabled          = true
  dns_prefix                       = var.cwr_cluster_name
  #role_based_access_control {
    #enabled = true
  #}

  default_node_pool {
    name                = "admin"
    node_count          = var.cwr_system_node_count
    vm_size             = var.cwr_aks_nodesize
    type                = "VirtualMachineScaleSets"
    #availability_zones  = [1, 2, 3]
    enable_auto_scaling = false
    vnet_subnet_id      = azurerm_subnet.akssubnet.id
    #node_taints          = ["CriticalAddonsOnly=true:NoSchedule"]
  }

  identity {
    type = "SystemAssigned"
  }
}