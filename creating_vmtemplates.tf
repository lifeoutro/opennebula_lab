resource "opennebula_template" "a174t" {
  name        = "Astra174-base"
  description = "Astra Linux 1.7.4.7 base"
  cpu         = 0.2
  vcpu        = 2
  memory      = 2048
  permissions = "664"

context = {
    NETWORK      = "YES"
    HOSTNAME     = "$NAME"
  }
graphics {
    type   = "VNC"
    listen = "0.0.0.0"
  }
features {
    acpi = "YES"
    guest_agent = "YES"
}
os {
    arch = "x86_64"
    boot = "disk0"
  }

disk {
    image_id = opennebula_image.images[0].id
    size     = var.system_volume_sizeMB
    driver   = "qcow2"
    target   = "vda"
  }

nic {
    model           = "virtio"
    network_id      = opennebula_virtual_network.default_nw.id
 #   security_groups = [opennebula_security_group.example.id]
  }
raw {
    type = "kvm"
    data = ""
}

#sched_requirements = "FREE_CPU > 60"
#tags = {
#    environment = "example"
#  }

}

resource "opennebula_template" "a175t" {
  name        = "astra175-max"
  description = "Astra Linux 1.7.5.7 max"
  cpu         = 0.2
  vcpu        = 2
  memory      = 2048
  permissions = "664"

context = {
    NETWORK      = "YES"
    HOSTNAME     = "$NAME"
  }
graphics {
    type   = "VNC"
    listen = "0.0.0.0"
  }
os {
    arch = "x86_64"
    boot = "disk0"
  }

disk {
    image_id = opennebula_image.images[1].id
    size     = var.system_volume_sizeMB
    target   = "vda"
    driver   = "qcow2"
  }


nic {
    model           = "virtio"
    network_id      = opennebula_virtual_network.default_nw.id
 #   security_groups = [opennebula_security_group.example.id]
  }

features {
    acpi = "YES"
    guest_agent = "YES"
}

#sched_requirements = "FREE_CPU > 60"
#tags = {
#    environment = "example"
#  }


}
