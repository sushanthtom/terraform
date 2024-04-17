resource "azurerm_kubernetes_cluster_node_pool" "boomilinux" {
  #availability_zones    = [1]
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.dev1.id
  max_count             = var.cwr_node_max_count
  min_count             = var.cwr_node_min_count
  mode                  = "User"
  name                  = var.cwr_deployment_name
  #orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = var.cwr_aks_disk_size
  os_type               = var.cwr_akspool_os # Default is Linux, we can change to Windows
  vm_size               = var.cwr_aks_nodesize
  vnet_subnet_id        =   azurerm_subnet.akssubnet.id
  priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  depends_on            = [azurerm_kubernetes_cluster.dev1]
  node_labels = {
    "nodepool-type" = "User"
    "environment"   = var.environment
    "nodepoolos"    = var.cwr_akspool_os
    "app"           = "boomiboomi"
  }
  tags = {
    "nodepool-type" = "User"
    "environment"   = var.environment
    "nodepoolos"    = var.cwr_akspool_os
    "app"           = "boomi"
  }
}