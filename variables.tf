variable var_images {
    default = [{"name" = "a174-base","link" = "https://dl.astralinux.ru/artifactory/mg-generic/alse/brest/alse-vanilla-1.7.4-brest-base-mg11.3.0.qcow2"},
               {"name" = "a175-max","link" = "https://dl.astralinux.ru/artifactory/mg-generic/alse/brest/alse-vanilla-1.7.5-brest-max-mg12.1.2.qcow2"}
                ]
}
/*
variable vm_template {
    default = "1"
}
*/

variable "default_images_datastore_id" {
    default = 1
}

variable "system_volume_sizeMB" {
    default = 29000
    }


variable "create_termidesk_vms" {
    default = false
}

variable "termidesk_distributed" {
    default = [{"count" = 1, "name" = "td-disp", "cpu" = 0.3, "vcpu" = 2,"memory" = 512, "description" = "Termidesk dispatcher server"},
                {"count" = 1, "name" = "td-task", "cpu" = 0.3, "vcpu" = 2, "memory" = 1024, "description" = "Termidesk task manager server"},
                {"count" = 0, "name" = "td-gw", "cpu" = 0.3, "vcpu" = 2, "memory" = 1024, "description" = "Termidesk gateway server"},
                {"count" = 0, "name" = "td-nginx", "cpu" = 0.2, "vcpu" = 1, "memory" = 1024, "description" = "nginx LB for Termidesk"} ]
    }

//blank block device meaning in order: create (true/false), size , persistent (true/false)
variable "create_blank_ceph_disk" {
    default = [true, 30*1024,false]
}

variable "attach_blank_disk" {
    default = true
}