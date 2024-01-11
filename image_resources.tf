#создаем образы в цикле по переменным

resource "opennebula_image" "images" {
   count = length (var.var_images)
   name = element(var.var_images,count.index).name
   path = element(var.var_images,count.index).link
   dev_prefix  = "vd"
   persistent = false
   datastore_id = var.default_images_datastore_id
}

resource "opennebula_image" "blank_base" {
   count       = var.create_blank_disk[0] ? 1:0
   name        = var.create_blank_disk[1]
   dev_prefix  = "vd"
   size        = var.create_blank_disk[2]
   persistent  = var.create_blank_disk[3]
   datastore_id = var.default_images_datastore_id
}