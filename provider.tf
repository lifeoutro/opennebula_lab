terraform {
  required_providers {
    opennebula = {
      source  = "OpenNebula/opennebula"
      version = "~> 1.3"
    }
  }
}
provider "opennebula" {
  endpoint = "http://192.168.201.150:2633/RPC2"
  username = "brestadmin"
  password = "dad9e8dc2d4747198a4bde11349d44c6f285e0ee70c6a665024eab05c4e30ac6"
  insecure = "true"
}