resource "yandex_vpc_network" "my_network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public" {
  name           = var.subnet_public_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = var.v4_cidr_public
}

resource "yandex_vpc_subnet" "private" {
  name           = var.subnet_private_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = var.v4_cidr_private
  route_table_id = yandex_vpc_route_table.private_rt.id
}

resource "yandex_compute_instance" "nat_instance" {
  name        = var.nat_name
  platform_id = var.default_platform_id
  zone        = var.default_zone

  resources {
    cores  = var.nat_instance_resources.cores
    memory = var.nat_instance_resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    ip_address = var.nat_instance_ip_address
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_vpc_route_table" "private_rt" {
  name       = var.private_rt_name
  network_id = yandex_vpc_network.my_network.id

  static_route {
    destination_prefix = var.private_rt_route.destination_prefix
    next_hop_address   = var.private_rt_route.next_hop_address
  }
}

resource "yandex_compute_instance" "public_vm" {
  name        = var.public_vm_name
  platform_id = var.default_platform_id
  zone = var.default_zone
  resources {
    cores         = var.public_vm_resources.cores
    memory        = var.public_vm_resources.memory
    core_fraction = var.public_vm_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys           = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_compute_instance" "private_vm" {
  name        = var.private_vm_name
  platform_id = var.default_platform_id
  zone = var.default_zone
  resources {
    cores         = var.private_vm_resources.cores
    memory        = var.private_vm_resources.memory
    core_fraction = var.private_vm_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }

  metadata = {
    ssh-keys           = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}