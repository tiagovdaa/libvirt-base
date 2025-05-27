locals {
  network_cidr = "${var.network_address}/${var.netmask}"
}

resource "libvirt_network" "network" {
  count     = var.create_network ? 1 : 0
  name      = var.network_name
  mode      = var.network_mode
  domain    = var.network_domain
  addresses = [local.network_cidr]

  dhcp {
    enabled = true
  }

  dns {
    enabled = true
  }
}

resource "null_resource" "enable_autostart" {
  count = var.create_network ? 1 : 0

  provisioner "local-exec" {
    command = "virsh net-autostart ${libvirt_network.network[0].name}"
  }

  depends_on = [libvirt_network.network]
}

