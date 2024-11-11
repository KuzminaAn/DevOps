resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/hosts.tftpl", {
    webservers = [
      for inst in yandex_compute_instance.web : {
        name        = inst.name
        external_ip = inst.network_interface[0].nat_ip_address
        fqdn        = format("%s.%s.%s", inst.hostname != "" ? inst.hostname : format("%s-%d", inst.name, index(yandex_compute_instance.web, inst)), var.default_zone, var.vm_fqdn)
      }
    ]

    databases = [
      for inst in yandex_compute_instance.database : {
        name        = inst.name
        external_ip = inst.network_interface[0].nat_ip_address
        fqdn        = format("%s.%s.%s", inst.hostname != "" ? inst.hostname : format("%s-%d", inst.name, index(yandex_compute_instance.database, inst)), var.default_zone, var.vm_fqdn)
      }
    ]

    storages = [{
      name = yandex_compute_instance.storage.name
      external_ip = yandex_compute_instance.storage.network_interface[0].nat_ip_address
      fqdn        = format("%s.%s.%s", yandex_compute_instance.storage.hostname != "" ? yandex_compute_instance.storage.hostname : format("%s-%d", yandex_compute_instance.storage.name), var.default_zone, var.vm_fqdn)
    }
    ]
  }
  )

  filename = "${path.module}/ansible_inventory.ini"
}
