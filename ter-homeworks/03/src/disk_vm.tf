resource "yandex_compute_disk" "storage-disk" {
    count    = 3
    name     = format("%s-%d", var.disk_name, count.index)
    zone     = var.default_zone
    size     = var.disk_size
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage_name
  hostname    = var.storage_hostname != "" ? var.storage_hostname : format("%s-%d", var.storage_name)
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone

  resources {
    cores         = var.storage_cores
    memory        = var.storage_memory
    core_fraction = var.storage_core_fraction
  }

  boot_disk {
    initialize_params {
        size     = var.storage_size
        image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage-disk
    content {
        disk_id = secondary_disk.value.id  
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

}