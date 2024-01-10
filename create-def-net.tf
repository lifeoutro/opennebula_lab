resource "opennebula_virtual_network" "default_nw" {
  name         = "Default network"
  permissions  = "664"
  bridge       = "br0"
  dns          = "77.88.8.8 8.8.4.4"
  gateway      = "10.10.10.1"
  network_mask = "255.255.255.0"
  cluster_ids = [0]
  tags = {
    name = "DefaultNW"
  }
}

resource "opennebula_virtual_network_address_range" "defautl_nw_range" {
  virtual_network_id = opennebula_virtual_network.default_nw.id
  ar_type            = "IP4"
#  mac                = "02:00:fc:10:64:6e"
  size               = 200
  ip4                = "10.10.10.2"

 # hold_ips = ["172.16.100.112", "172.16.100.114"]
}
