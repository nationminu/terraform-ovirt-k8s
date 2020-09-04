output "id" {
  description = "VM ID"
  value       = "${ovirt_vm.vm.id}"
}
output "ip" {
  description = "VM IP"
  value       = "${ovirt_vm.vm.initialization.0.nic_configuration.0.address}"
}
