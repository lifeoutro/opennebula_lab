variable var_images {
    default = [{"name" = "a174-base","link" = "https://dl.astralinux.ru/artifactory/mg-generic/alse/brest/alse-vanilla-1.7.4-brest-base-mg11.3.0.qcow2"},
               {"name" = "a175-max","link" = "https://dl.astralinux.ru/artifactory/mg-generic/alse/brest/alse-vanilla-1.7.5-brest-max-mg12.1.2.qcow2"}
                ]
}

variable nw_settings {
    default = {  
        name           = "Default network"
        permissions    = "664"
        bridge         = "br0"
        dns            = "77.88.8.8 8.8.4.4"
        gateway        = ""
        network_mask   = "255.255.255.0"
        range_start_ip = "10.10.10.2"
        range_size     = 200
        tags = {
            name = "DefaultNW"
            }
    }
}

variable "default_system_datastore" {
    default = " ID = \"102\""   // SSD:105 HDD:102
}

variable "ssd_system_datastore" {
    default = " ID = \"105\""   // SSD:105 HDD:102
}

variable "hdd_system_datastore" {
    default = " ID = \"102\""   // SSD:105 HDD:102
}

variable "default_images_datastore_id" {
    default = 1
}

variable "system_volume_sizeMB" {
    default = 30*1024
    }


variable "create_termidesk_vms" {
    default = true
}

// datastore = "" - will use default datastore
variable "termidesk_distributed" {
    default = [{"count" = 0, "name" = "td-disp", "cpu" = 0.3, "vcpu" = 2,"memory" = 512, "description" = "Termidesk dispatcher server","datastore" = "ssd"},
                {"count" = 0, "name" = "td-task", "cpu" = 0.3, "vcpu" = 2, "memory" = 1024, "description" = "Termidesk task manager server","datastore" = "ssd"},
                {"count" = 0, "name" = "td-gw", "cpu" = 0.3, "vcpu" = 2, "memory" = 1024, "description" = "Termidesk gateway server","datastore" = "ssd"},
                {"count" = 0, "name" = "td-nginx", "cpu" = 0.2, "vcpu" = 1, "memory" = 1024, "description" = "nginx LB for Termidesk","datastore" = "ssd"} ]
    }

//blank block device meaning in order: create (true/false),diskname, size , persistent (true/false)
variable "create_blank_disk" {
    default = [true, "blank_base", 1024, false]
}

variable "attach_additional_disk" {
    default = [30*1024,25*1024]
}

variable "create_ceph_vms" {
    default = true
}

// datastore = "" - will use default datastore
variable "ceph_vms" {
    default = [{"count" = 3, "name" = "ceph", "cpu" = 0.3, "vcpu" = 2,"memory" = 4*1024, "description" = "Ceph mon,mgr,osd", "datastore" = ""}
                 ]
    }
