
resource "yandex_compute_instance" "web" {
  count       = var.vm_web_count
  name        = format("%s-%d", var.vm_web_name, count.index + 1)
  hostname    = var.vm_web_hostname != "" ? var.vm_web_hostname : format("%s-%d", var.vm_web_name, count.index + 1)
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone

  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }

  boot_disk {
    initialize_params {
        size   = var.vm_web_size
        image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }

  depends_on = [yandex_compute_instance.database]

}
