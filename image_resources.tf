#создаем образы в цикле по переменным

resource "opennebula_image" "images" {
   count = length (var.var_images)
   name = element(var.var_images,count.index).name
   path = element(var.var_images,count.index).link
   persistent = false
   datastore_id = var.default_images_datastore_id
}

resource "opennebula_image" "blank30" {
   count       = var.create_blank_ceph_disk[0] ? 1:0
   name        = "Blank-30"
   dev_prefix  = "vd"
   size        = var.create_blank_ceph_disk[1]
   persistent  = var.create_blank_ceph_disk[2]
   datastore_id = var.default_images_datastore_id
}