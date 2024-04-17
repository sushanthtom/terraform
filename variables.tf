####Resource Group, Location and Enviremnt #####
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}
variable "environment" {
  type        = string
  description = "Environment Type"
}

######Virtual Network, Subnet #####
variable "virtual_network" {
  type        = string
  description = "virtual Network Name"
}
variable "cwr_aks_name" {
  type        = string
  description = "Cluster Subnet Name"
}
variable "cwr_vnode_name" {
  type        = string
  description = "Node Subnet Name"
}
variable "cwr_nfs_name" {
  type        = string
  description = "NFSServer Subnet Name"
}
variable "network_interface_name" {
  type        = string
  description = "NFSServer_NIC"
}
variable "cwr_nfsnsg_name" {
  type        = string
  description = "NSG Name"
}
variable "cwr_public_ip_name" {
  type        = string
  description = "NFSServerPIP"
}
variable "cwr_address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.100.0.0/16"]
}
variable "cwr_aks_subnet" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.100.0.0/20"]
}
variable "cwr_vnode_subnet" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.100.17.0/24"]
}

variable "cwr_nfs_subnet" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.100.18.0/24"]
}

variable "cwr_firewall_subnet" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.100.250.0/24"]
}

#####Virtual Mechine ######
variable "linux_virtual_machine_name" {
  type        = string
  description = "NFSServer"
}
variable "cwr_nfs_ip_name" {
  type        = string
  description = "Boomi NFS Server Privet IPAssign"
}
variable "cwr_boomi_vm_size" {
  type        = string
  description = "VM size of Boomi NFS Server"
}
variable "cwr_boomi_os_disk" {
  type        = string
  description = "OS Disk of Boomi"
}
variable "cwr_boomi_data_disk" {
  type        = string
  description = "Name of Boomi Data Disk"
}
variable "cwr_boomi_storage_type" {
  type        = string
  description = "StorageAccount type"
}
variable "cwr_boomi_disk_caching" {
  type        = string
  description = "DIsk caching Type"
}
variable "cwr_nfsdatadisk_size" {
  type        = string
  description = "Boomi NFS Server Data Disk Size"
}
variable "cwr_disk_lun" {
  type        = string
  description = "Boomi NFS Server Data Disk LUN num"
}

#####AKS Cluster ###
variable "cwr_cluster_name" {
  type        = string
  description = "AKS name in Azure"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}
variable "cwr_system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}
variable "cwr_akspool_os" {
  type        = string
  description = "AKS Node Pool OS"
}
variable "cwr_node_max_count" {
  type        = number
  description = "maxcount of node"
}
variable "cwr_node_min_count" {
  type        = number
  description = "mincount of node"
}
variable "cwr_service_cidr" {
  type        = string
  description = "AKS Service IP Range"
}
variable "cwr_network_plugin" {
  type        = string
  description = "AKS Network Plugin Type"
}
variable "cwr_network_policy" {
  type        = string
  description = "Network Policy Type"
}
variable "cwr_dns_service_ip" {
  type        = string
  description = "DNS Servive IP"
}
variable "cwr_docker_bridge_cidr" {
  type        = string
  description = "docker_bridge_cidr"
}
variable "cwr_load_balancer_sku" {
  type        = string
  description = "load Balncer Type"
}
variable "cwr_aks_nodesize" {
  type        = string
  description = "aks_nodesize"
}
variable "cwr_aks_disk_size" {
  type        = string
  description = "AKS Disk Size"
}
variable "cwr_deployment_name" {
  type        = string
  description = "Name of Deployment Pool"
}
variable "cwr_monitoring_name" {
  type        = string
  description = "Name of Monitoring Pool"
}

