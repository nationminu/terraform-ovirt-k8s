variable "ovirt_url" {
  description = "oVirt API URL"
  default     = "https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api"
}

variable "ovirt_username" {
  description = "oVirt Admin user"
  default     = "admin@internal"
}

variable "ovirt_password" {
  description = "oVirt Admin password" 
}

# https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api/clusters
variable "cluster_id" {
  description = "oVirt Cluster ID"
  default     = "b88ce044-e54b-11ea-b386-525400a97cd1"
}

variable "storagedomain_id" {
  description = "oVirt Storage Domain ID"
  default     = "db90ad33-cf38-490f-8a0a-22961b7a8ee2"
}

variable "template_id" {
  description = "oVirt Templage ID"
  default     = "e35aa687-8e84-49ab-9dbb-d25acd3f2b47"
  #default     = "2d947c23-160b-439c-9ccb-258a5ac85a20"
  #default     = "8d71ced9-8fa1-42b8-a8cc-314b9d8fbfc0"
}

variable "network_id" {
  description = "oVirt Network ID"
  default     = "00000000-0000-0000-0000-000000000009"
}

variable "private_network_id" {
  description = "oVirt Network ID"
  default     = "252a625f-4ed9-4149-9540-fee5bd81cc75"
}

