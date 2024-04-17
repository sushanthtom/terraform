###Resource Group, Vnet and Subnet###
resource_group_name     = "sample-boomi"
location                = "East US"
virtual_network         = "boomi"
cwr_aks_name            = "AKS-Subnet"
cwr_vnode_name          = "nfssubnet"
cwr_nfs_name            = "NFS-Subnet"
#cwr_ddosplan            = "CWR-DDOS"
cwr_public_ip_name      = "CWR-NFS-PIP"
network_interface_name  = "CWR-Boomi-NFS-NIC"
environment             = "Production"
cwr_nfsnsg_name         = "CWR-BoomiNFS-NSG"
cwr_address_space       = ["10.100.0.0/16"]
cwr_aks_subnet          = ["10.100.0.0/20"]
cwr_vnode_subnet        = ["10.100.17.0/24"]
cwr_nfs_subnet          = ["10.100.18.0/24"]
cwr_firewall_subnet     = ["10.100.250.0/24"]

###Virtual Mechine###
linux_virtual_machine_name  =   "BoomiNFSServer"
cwr_nfs_ip_name             =   "Boomi-NFS-PrivetIP"
cwr_boomi_vm_size           =   "Standard_DS1_v2"
cwr_boomi_os_disk           =   "Boomi-NFS-OS-Disk"
cwr_boomi_storage_type      =   "Standard_LRS"
cwr_boomi_data_disk         =   "Boomi-NFS-Data-Disk"
cwr_boomi_disk_caching      =   "ReadWrite"
cwr_nfsdatadisk_size        =   "512"
cwr_disk_lun                =   "0"

###AKS Cluster###
cwr_cluster_name         =  "boomi-AKS2"
cwr_deployment_name      =  "boomipool"
cwr_monitoring_name      =  "monitoring"
kubernetes_version       =  "1.29.0"
cwr_akspool_os           =  "Linux"
cwr_system_node_count    =  "1"
cwr_service_cidr         =  "10.0.10.0/24"
cwr_network_plugin       =  "azure"
cwr_network_policy       =  "azure"
cwr_dns_service_ip       =  "10.0.10.10"
cwr_docker_bridge_cidr   =  "172.17.0.1/16"
cwr_load_balancer_sku    =  "Standard"
cwr_aks_nodesize         =  "Standard_D2s_v3"
cwr_node_min_count       =  "1"
cwr_node_max_count       =  "1"
cwr_aks_disk_size        =  "128"