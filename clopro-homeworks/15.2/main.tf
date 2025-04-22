resource "yandex_vpc_network" "network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.v4_cidr_blocks
}

data "yandex_iam_service_account" "existing" {
  name = var.account
}

resource "yandex_compute_instance_group" "lamp_group" {
  name               = var.lamp_group_name
  folder_id          = var.folder_id
  service_account_id = data.yandex_iam_service_account.existing.id
  deletion_protection = false

  instance_template {
    platform_id = var.default_platform_id
    resources {
      memory = var.instance_group_resources.memory
      cores  = var.instance_group_resources.cores
    }

    boot_disk {
      initialize_params {
        image_id = var.instance_group_disk.image_id
        size     = var.instance_group_disk.size
      }
    }

    network_interface {
      network_id = yandex_vpc_network.network.id
      subnet_ids = [yandex_vpc_subnet.subnet.id]
      nat        = true
    }

    metadata = {
      user-data = templatefile("${path.module}/user-data.sh", {
        bucket_name = yandex_storage_bucket.bucket.bucket
        image_key   = yandex_storage_object.image.key
    })
  }
  }

  scale_policy {
    fixed_scale {
      size = var.scale_size
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = var.deploy_policy.max_unavailable
    max_expansion   = var.deploy_policy.max_expansion
  }

  health_check {
    interval            = var.instance_group_health_check.interval
    timeout             = var.instance_group_health_check.timeout
    unhealthy_threshold = var.instance_group_health_check.unhealthy_threshold
    healthy_threshold   = var.instance_group_health_check.healthy_threshold
    http_options {
      path = var.instance_group_health_check.http_path
      port = var.instance_group_health_check.http_port
    }
  }
}

resource "yandex_lb_target_group" "network_lb_target_group" {
  name      = var.target_group_name
  region_id = var.target_group_region_id

  dynamic "target" {
    for_each = yandex_compute_instance_group.lamp_group.instances
    content {
      subnet_id = yandex_vpc_subnet.subnet.id
      address   = target.value.network_interface[0].ip_address
    }
  }
}

resource "yandex_lb_network_load_balancer" "network_lb" {
  name = var.lb_network_name

  listener {
    name = var.lb_network_listener.name
    port = var.lb_network_listener.port
    external_address_spec {
      ip_version = var.lb_network_listener.ip_version
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.network_lb_target_group.id

    healthcheck {
      name = var.target_group_health_check.name
      interval = var.target_group_health_check.interval
      timeout = var.target_group_health_check.timeout
      unhealthy_threshold = var.target_group_health_check.unhealthy_threshold
      healthy_threshold = var.target_group_health_check.healthy_threshold
      http_options {
        port = var.target_group_health_check.port
        path = var.target_group_health_check.path
      }
    }
  }
}