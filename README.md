# libvirt-base

Terraform configuration for setting up base infrastructure for KVM/libvirt virtualization.

## Overview

This project automates the creation of **custom libvirt storage pools** and a **virtual network** using [Terraform](https://www.terraform.io/) and the [libvirt provider](https://github.com/dmacvicar/terraform-provider-libvirt). It is designed as a foundational layer for virtualization environments, but **does not create any virtual machines or volumes**.

You can use this configuration to prepare a host with reusable infrastructure components like:

- Storage pools for base images, VM disks, ISO files, and floppy images
- A NAT-based virtual network with DHCP and DNS

## Features

- 🔁 Conditional creation of each storage pool
- 🌐 Configurable virtual network with DNS, DHCP, and NAT support
- 🔐 Customizable permissions (UID, GID, and mode) for pool directories
- 🧩 Uses XSLT to set libvirt-specific options not natively supported by Terraform schema (e.g., pool directory permissions)

## Prerequisites

- Linux with [KVM](https://www.linux-kvm.org/page/Main_Page) and [libvirt](https://libvirt.org/) installed
- Terraform installed (v1.0+ recommended)
- [terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt) installed
- User must have permissions to interact with libvirt (e.g., member of `libvirt` group)

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/tiagovdaa/libvirt-base.git
   cd libvirt-base
   ````

2. Edit the `terraform.tfvars` file to match your environment and preferences.

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Apply the configuration:

   ```bash
   terraform apply
   ```

## Configuration

Customize `terraform.tfvars` to control which resources are created and how.

### Storage Pools

```hcl
uid = 64055
gid = 994
mode = 750

# base images
base_image_pool_name       = "cloud-images"
create_base_image_pool     = true
base_image_pool_path       = "/data/libvirt/cloud-images"

# vm disks   
vm_disk_pool_name          = "vms"
create_vm_disk_pool        = true
vm_disk_pool_path          = "/data/libvirt/vms"

# iso images    
iso_pool_name              = "iso"
create_iso_pool            = true
iso_pool_path              = "/data/libvirt/iso"

# floppy disk images
floppy_pool_name           = "floppy"
create_floppy_pool         = true
floppy_pool_path           = "/data/libvirt/floppy"
```

### Network Settings

```hcl
network_name               = "lab"
create_network             = true
network_domain             = "lab.net"
network_address            = "192.168.0.0"
netmask                    = "24"
gateway                    = "192.168.0.1"
dns_servers                = ["192.168.0.1", "8.8.8.8", "8.8.4.4"]
network_mode               = "nat"
```

> 🔧 Set `create_*` flags to `false` to skip creating a specific pool or network.

## Project Structure

```
.
├── cloud-init/                 # Placeholder for future integration
├── main.tf                     # Main Terraform definitions
├── outputs.tf                  # Output values
├── pool-xslt/                  # XSLT templates for pool permissions
├── terraform.tfvars            # User configuration
├── variables.tf                # Variable declarations
```

## Notes

* This setup **does not create VMs** — it lays the groundwork for VM deployment.
* The `null_resource` and XSLT logic are used to set `autostart` on networks and permissions on pool directories, which are not natively supported by Terraform's libvirt schema.


