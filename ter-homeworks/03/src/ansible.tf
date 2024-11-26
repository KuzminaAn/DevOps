resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/hosts.tftpl", {

    default_zone = var.default_zone
    vm_fqdn = var.vm_fqdn

    webservers = yandex_compute_instance.web

    databases =  yandex_compute_instance.database

    storages = [yandex_compute_instance.storage]

  })

  filename = "${path.module}/ansible_inventory.ini"

}
