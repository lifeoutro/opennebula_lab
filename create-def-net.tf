resource "opennebula_virtual_network" "default_nw" {
  name         = var.nw_settings.name
  permissions  = var.nw_settings.permissions
  bridge       = var.nw_settings.bridge
  dns          = var.nw_settings.dns
  gateway      = var.nw_settings.gateway
  network_mask = var.nw_settings.network_mask
  cluster_ids = [0]
  tags = var.nw_settings.tags
}

resource "opennebula_virtual_network_address_range" "defautl_nw_range" {
  virtual_network_id = opennebula_virtual_network.default_nw.id
  ar_type            = "IP4"
#  mac                = "02:00:fc:10:64:6e"
  size               = var.nw_settings.range_size
  ip4                = var.nw_settings.range_start_ip

 # hold_ips = ["172.16.100.112", "172.16.100.114"]
}
