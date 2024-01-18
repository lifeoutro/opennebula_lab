resource "opennebula_virtual_network" "inet" {
    dns               = "192.168.201.1 192.168.201.200"
    gateway           = "192.168.201.1"
    name              = "inet"
    network_address   = "192.168.201.0"
    network_mask      = "255.255.255.0"
}