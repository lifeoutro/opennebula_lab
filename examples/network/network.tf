resource "opennebula_virtual_network" "test_v_net" {
  name         = "test-v-net"
  permissions  = "664"
  bridge       = "br0"
  dns          = "10.177.126.31"
  gateway      = "10.177.127.254"
  network_mask = "255.255.252.0"
  cluster_ids = [0]
  tags = {
    name = "newtestnetwork"
  }
}

resource "opennebula_virtual_network_address_range" "test_v_net_range" {
  virtual_network_id = opennebula_virtual_network.test_v_net.id
  ar_type            = "IP4"
  mac                = "02:00:ac:10:64:6e"
  size               = 5
  ip4                = "10.177.126.51"

 # hold_ips = ["172.16.100.112", "172.16.100.114"]
}






#data "opennebula_virtual_network" "new" {
#  name = "test-v-net"
#}

#output "new-net" {
#  value = data.opennebula_virtual_network.new
#}