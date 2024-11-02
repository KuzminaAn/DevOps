output "vm_web" {
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface[0].nat_ip_address
    fqdn          = format("%s.%s", yandex_compute_instance.platform.hostname, var.vm_web_fqdn)
  }
}

output "vm_db" {
  value = {
    instance_name = yandex_compute_instance.database.name
    external_ip   = yandex_compute_instance.database.network_interface[0].nat_ip_address
    fqdn          = format("%s.%s", yandex_compute_instance.database.hostname, var.vm_db_fqdn)
  }
}
