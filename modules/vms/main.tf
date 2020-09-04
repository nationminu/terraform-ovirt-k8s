resource "ovirt_vm" "vm" {
  name                 = var.vm_name
  clone                = "false"
  high_availability    = "true"
  cluster_id           = var.cluster_id
  memory               = var.vm_memory
  template_id          = var.vm_template_id
  cores                = var.vm_cpu_cores
  sockets              = var.vm_cpu_sockets
  threads              = var.vm_cpu_threads  

  initialization {
    authorized_ssh_key = var.vm_authorized_ssh_key
    host_name          = var.vm_hostname
    timezone           = var.vm_timezone
    user_name          = var.vm_user_name
    custom_script      = var.vm_custom_script
    dns_search         = var.vm_dns_search
    dns_servers        = var.vm_dns_servers 

    nic_configuration {
      label              = var.vm_nic_device
      boot_proto         = var.vm_nic_boot_proto
      address            = var.vm_nic_ip_address
      gateway            = var.vm_nic_gateway
      netmask            = var.vm_nic_netmask
      on_boot            = var.vm_nic_on_boot
    }
  }

  connection {
    user = var.vm_user_name
    host = var.vm_nic_ip_address
    private_key = var.vm_private_ssh_key
    agent = "false"
    timeout = "5m"
  }  
   
  provisioner "file" {
    source = "ssh/id_rsa"
    destination = "/home/${var.vm_user_name}/.ssh/id_rsa"
  } 

  provisioner "file" {
    source = "provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [  
#      "sudo yum -y update",
      "sudo cp -r  /home/${var.vm_user_name}/.ssh/id_rsa /root/.ssh/",
      "sudo chmod 0600 /root/.ssh/id_rsa",
      "sudo chmod 0600 /home/${var.vm_user_name}/.ssh/id_rsa",
#      "sudo chmod +x /tmp/provision.sh",
#      "/tmp/provision.sh"
#      "sudo yum install -y yum-utils device-mapper-persistent-data lvm2",
#      "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo", 
#      "sudo yum install -y java-1.8.0-openjdk-devel java-1.8.0-openjdk docker-ce docker-ce-cli containerd.io",
#      "sudo sed -i 's/\(containerd.sock\)\(.*$\)/\1 -H=tcp:\/\/0.0.0.0:2375\/' /lib/systemd/system/docker.service"
#      "sudo systemctl enable docker",
#      "sudo systemctl start docker",
#      "sudo sysctl -w vm.max_map_count=262144"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      #echo "${element(split(".", var.vm_hostname),0)} ansible_host=${var.vm_nic_ip_address} ansible_user=${var.vm_user_name}" >> hosts.ini
      echo "${var.vm_hostname} ansible_host=${var.vm_nic_ip_address} ansible_user=${var.vm_user_name}" >> hosts.ini
      EOF
  }
}
