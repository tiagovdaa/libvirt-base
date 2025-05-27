# Create base image storage pool if required
resource "libvirt_pool" "base_image_pool" {
  count = var.create_base_image_pool ? 1 : 0

  name = var.base_image_pool_name
  type = "dir"

  target {
    path = var.base_image_pool_path
  }

  xml {
    xslt = templatefile("${path.module}/pool_permissions.xslt",{
      uid  = var.uid
      gid  = var.gid
      mode = var.mode
    })
  }
}

# Create VM disks storage pool if required
resource "libvirt_pool" "vm_disk_pool" {
  count = var.create_vm_disk_pool ? 1 : 0

  name = var.vm_disk_pool_name
  type = "dir"

  target {
    path = var.vm_disk_pool_path
  }

  xml {
    xslt = templatefile("${path.module}/pool_permissions.xslt",{
      uid  = var.uid
      gid  = var.gid
      mode = var.mode
    })
  }
}

# Create iso files storage pool if required
resource "libvirt_pool" "iso_pool" {
  count = var.create_iso_pool ? 1 : 0

  name = var.iso_pool_name
  type = "dir"

  target {
    path = var.iso_pool_path
  }

  xml {
    xslt = templatefile("${path.module}/pool_permissions.xslt",{
      uid  = var.uid
      gid  = var.gid
      mode = var.mode
    })
  }
}

# Create floppy disks storage pool if required
resource "libvirt_pool" "floppy_pool" {
  count = var.create_floppy_pool ? 1 : 0

  name = var.floppy_pool_name
  type = "dir"

  target {
    path = var.floppy_pool_path
  }

  xml {
    xslt = templatefile("${path.module}/pool_permissions.xslt",{
      uid  = var.uid
      gid  = var.gid
      mode = var.mode
    })
  }
}
