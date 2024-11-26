data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}

resource "yandex_compute_instance" "database" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name  = each.key
  hostname = each.key
  resources {
    cores    = each.value.cpu
    memory   = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
        size = each.value.size
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

}