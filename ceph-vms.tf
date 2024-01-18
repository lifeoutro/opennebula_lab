locals {
//     templateid = opennebula_template.a174t.id
     ceph = flatten([for item in var.ceph_vms : [
            for c in range(1,item["count"] + 1) : 
             {"name" = "${item["name"]}${c}"
              "cpu" = "${item["cpu"]}"
              "vcpu" = "${item["vcpu"]}"
              "memory" = "${item["memory"]}" 
              "description" = "${item["description"]}"
              "datastore" = "${item["datastore"]}"         
             }             
            ]
          ])
}

/*
output "out_ceph" {
    value = local.ceph
}
*/

resource "opennebula_virtual_machine" "cephvms" {
  for_each = {for vm in local.ceph: vm.name => vm if var.create_ceph_vms}
  name        = each.value.name
  description = each.value.description
  cpu         = each.value.cpu
  vcpu        = each.value.vcpu
  memory      = each.value.memory
  sched_ds_requirements = each.value.datastore == "hdd" ? local.hdddatastoreid : each.value.datastore == "ssd" ? local.ssddatastoreid: local.defaultdatastoreid
context = {
    NETWORK      = "YES"
    HOSTNAME     = each.value.name
  }

os {
    arch = "x86_64"
    boot = "disk0"
  }

disk {
    image_id = opennebula_image.images[0].id
    size     = var.system_volume_sizeMB
    driver   = "qcow2"
  }

dynamic "disk" {
  for_each = var.attach_additional_disk
  content {
    image_id = opennebula_image.blank_base[0].id 
    size     = disk.value
  }
}

nic {
    model           = "virtio"
    network_id      = opennebula_virtual_network.inet.id

  }

nic {
    model           = "virtio"
    network_id      = opennebula_virtual_network.default_nw.id 
  }

template_id = local.templateid

}