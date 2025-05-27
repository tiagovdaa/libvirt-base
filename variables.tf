variable "uid" {
  description = "UID for the storage directory owner (e.g., libvirt-qemu)"
  type        = number
  default     = 107
}

variable "gid" {
  description = "GID for the storage directory group (e.g., libvirt-qemu)"
  type        = number
  default     = 107
}

variable "mode" {
  description = "Permissions mode for the directory (e.g., 0770)"
  type        = string
  default     = "0770"
}

variable "base_image_pool_name" {
  description = "Name of the storage pool for base images"
  type        = string
  default     = "images"
}

variable "create_base_image_pool" {
  description = "Set to true to create the base image storage pool if it doesn't exist"
  type        = bool
  default     = false
}

variable "base_image_pool_path" {
  description = "Filesystem path for the base image storage pool (required if create_base_image_pool is true)"
  type        = string
  default     = "/var/lib/libvirt/images"
}

variable "vm_disk_pool_name" {
  description = "Name of the storage pool for VM disks"
  type        = string
  default     = "vms"
}

variable "create_vm_disk_pool" {
  description = "Set to true to create the VM disks storage pool if it doesn't exist"
  type        = bool
  default     = false
}

variable "vm_disk_pool_path" {
  description = "Filesystem path for the VM disks storage pool (required if create_vm_disk_pool is true)"
  type        = string
  default     = "/var/lib/libvirt/vms"
}

variable "iso_pool_name" {
  description = "Name of the storage pool for VM disks"
  type        = string
  default     = "vms"
}

variable "create_iso_pool" {
  description = "Set to true to create the VM disks storage pool if it doesn't exist"
  type        = bool
  default     = false
}

variable "iso_pool_path" {
  description = "Filesystem path for the VM disks storage pool (required if create_vm_disk_pool is true)"
  type        = string
  default     = "/var/lib/libvirt/vms"
}

variable "floppy_pool_name" {
  description = "Name of the storage pool for VM disks"
  type        = string
  default     = "vms"
}

variable "create_floppy_pool" {
  description = "Set to true to create the VM disks storage pool if it doesn't exist"
  type        = bool
  default     = false
}

variable "floppy_pool_path" {
  description = "Filesystem path for the VM disks storage pool (required if create_vm_disk_pool is true)"
  type        = string
  default     = "/var/lib/libvirt/vms"
}

variable "network_name" {
  description = "Name of the network to use"
  type        = string
  default     = "default"
}

variable "network_mode" {
  description = "Network mode: nat, isolated, etc."
  type        = string
  default     = "nat"
}

variable "network_address" {
  description = "Base network address (e.g., '192.168.100.0')"
  type        = string
  default     = "192.168.100.0"
}

variable "netmask" {
  description = "Netmask for static IP configuration (in CIDR notation, e.g., '24')"
  type        = string
  default     = "24"
}

variable "gateway" {
  description = "Gateway for static IP configuration"
  type        = string
}

variable "dns_servers" {
  description = "List of DNS servers"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "network_domain" {
  description = "Domain name for the network (optional)"
  type        = string
  default     = "k8s.local"
}

variable "create_network" {
  description = "Set to true to create the network, false to use an existing network"
  type        = bool
  default     = false
}