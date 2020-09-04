provider "ovirt" {
  url      = var.ovirt_url
  username = var.ovirt_username
  password = var.ovirt_password
}

terraform {
  backend "local" {
    path = "ovirt_terraform.tfstate"
  }
}

locals {
  vm_prefix = "example" #CHANGEME
  vm_domains = "example.com" #CHANGEME
  vm_username = "terra" #CHANGEME
  vm_authorized_key = "${file(pathexpand("./ssh/id_rsa.pub"))}"
  vm_private_key    = "${file(pathexpand("./ssh/id_rsa"))}"
}

# Create VM call controller-0 
module "controller-0" {
  source                = "../modules/vms"
  cluster_id            = var.cluster_id
  vm_name               = "${local.vm_prefix}-controller-0"
  vm_hostname           = "controller-0.${local.vm_domains}"
  vm_dns_servers        = "8.8.8.8"
  vm_dns_search         = "dns.${local.vm_domains}"
  vm_memory             = "4096"
  vm_cpu_cores          = "2"
  vm_timezone           = "Asia/Seoul"
  vm_template_id        = var.template_id
  vm_user_name          = local.vm_username
  vm_authorized_ssh_key = local.vm_authorized_key
  vm_private_ssh_key    = local.vm_private_key

  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.x"  #CHANGEME
  vm_nic_gateway    = "10.65.40.1"    
  vm_nic_netmask    = "255.255.255.0"
} 

# Create VM call controller-1
module "controller-1" {
  source                = "../modules/vms"
  cluster_id            = var.cluster_id
  vm_name               = "${local.vm_prefix}-controller-1"
  vm_hostname           = "controller-1.${local.vm_domains}"
  vm_dns_servers        = "8.8.8.8"
  vm_dns_search         = "dns.${local.vm_domains}"
  vm_memory             = "4096"
  vm_cpu_cores          = "2"
  vm_timezone           = "Asia/Seoul"
  vm_template_id        = var.template_id
  vm_user_name          = local.vm_username
  vm_authorized_ssh_key = local.vm_authorized_key
  vm_private_ssh_key    = local.vm_private_key

  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.x" #CHANGEME
  vm_nic_gateway    = "10.65.40.1"
  vm_nic_netmask    = "255.255.255.0"
}  

# Create VM call controller-2
module "controller-2" {
  source                = "../modules/vms"
  cluster_id            = var.cluster_id
  vm_name               = "${local.vm_prefix}-controller-2"
  vm_hostname           = "controller-2.${local.vm_domains}"
  vm_dns_servers        = "8.8.8.8"
  vm_dns_search         = "dns.${local.vm_domains}"
  vm_memory             = "4096"
  vm_cpu_cores          = "2"
  vm_timezone           = "Asia/Seoul"
  vm_template_id        = var.template_id
  vm_user_name          = local.vm_username
  vm_authorized_ssh_key = local.vm_authorized_key
  vm_private_ssh_key    = local.vm_private_key

  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.x" #CHANGEME
  vm_nic_gateway    = "10.65.40.1"
  vm_nic_netmask    = "255.255.255.0"
}  

# Create VM call worker-0
module "worker-0" {
  source                = "../modules/vms"
  cluster_id            = var.cluster_id
  vm_name               = "${local.vm_prefix}-worker-0"
  vm_hostname           = "worker-0.${local.vm_domains}"
  vm_dns_servers        = "8.8.8.8"
  vm_dns_search         = "dns.${local.vm_domains}"
  vm_memory             = "4096"
  vm_cpu_cores          = "4"
  vm_timezone           = "Asia/Seoul"
  vm_template_id        = var.template_id
  vm_user_name          = local.vm_username
  vm_authorized_ssh_key = local.vm_authorized_key
  vm_private_ssh_key    = local.vm_private_key

  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.x" #CHANGEME
  vm_nic_gateway    = "10.65.40.1"
  vm_nic_netmask    = "255.255.255.0"
} 

# Create VM call worker-1
module "worker-1" {
  source                = "../modules/vms"
  cluster_id            = var.cluster_id
  vm_name               = "${local.vm_prefix}-worker-1"
  vm_hostname           = "worker-1.${local.vm_domains}"
  vm_dns_servers        = "8.8.8.8"
  vm_dns_search         = "dns.${local.vm_domains}"
  vm_memory             = "4096"
  vm_cpu_cores          = "4"
  vm_timezone           = "Asia/Seoul"
  vm_template_id        = var.template_id
  vm_user_name          = local.vm_username
  vm_authorized_ssh_key = local.vm_authorized_key
  vm_private_ssh_key    = local.vm_private_key

  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.x" #CHANGEME
  vm_nic_gateway    = "10.65.40.1"
  vm_nic_netmask    = "255.255.255.0"
}

# Create VM call worker-2
module "worker-2" {
  source                = "../modules/vms"
  cluster_id            = var.cluster_id
  vm_name               = "${local.vm_prefix}-worker-2"
  vm_hostname           = "worker-2.${local.vm_domains}"
  vm_dns_servers        = "8.8.8.8"
  vm_dns_search         = "dns.${local.vm_domains}"
  vm_memory             = "4096"
  vm_cpu_cores          = "4"
  vm_timezone           = "Asia/Seoul"
  vm_template_id        = var.template_id
  vm_user_name          = local.vm_username
  vm_authorized_ssh_key = local.vm_authorized_key
  vm_private_ssh_key    = local.vm_private_key

  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.x" #CHANGEME
  vm_nic_gateway    = "10.65.40.1"
  vm_nic_netmask    = "255.255.255.0"
}  

# Create VM call bastion
module "bastion" {
  source                = "../modules/vms"
  cluster_id            = var.cluster_id
  vm_name               = "${local.vm_prefix}-bastion"
  vm_hostname           = "bastion.${local.vm_domains}"
  vm_dns_servers        = "8.8.8.8"
  vm_dns_search         = "dns.${local.vm_domains}"
  vm_memory             = "4096"
  vm_cpu_cores          = "2"
  vm_timezone           = "Asia/Seoul"
  vm_template_id        = var.template_id
  vm_user_name          = local.vm_username
  vm_authorized_ssh_key = local.vm_authorized_key
  vm_private_ssh_key    = local.vm_private_key

  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.x" #CHANGEME
  vm_nic_gateway    = "10.65.40.1"
  vm_nic_netmask    = "255.255.255.0"
} 

## Create and attach Disk to VM bastion 
#module "bastion-disk" {
#  source            = "../modules/disk"
#  name              = "${local.vm_prefix}-bastion-disk"
#  size              = "100"
#  storage_domain_id = var.storagedomain_id
#  vm_id             = module.bastion.id
#}