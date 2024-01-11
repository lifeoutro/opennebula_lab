locals {
     templateid = opennebula_template.a174t.id
     termidesk = flatten([for item in var.termidesk_distributed : [
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
  defaultdatastoreid = var.default_system_datastore
  ssddatastoreid = var.ssd_system_datastore
  hdddatastoreid = var.hdd_system_datastore

}

/*
output "tdd" {
    value = local.termidesk
}
*/

resource "opennebula_virtual_machine" "tdvms" {
  for_each = {for vm in local.termidesk: vm.name => vm if var.create_termidesk_vms}
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

template_id = local.templateid

}
