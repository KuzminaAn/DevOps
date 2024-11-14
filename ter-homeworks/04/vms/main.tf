resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = var.develop_a_name
  zone           = var.develop-a_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.develop-a_cidr
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.develop_b_name
  zone           = var.develop-b_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.develop-b_cidr
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.marketing-vm_env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.develop-a_zone,var.develop-b_zone]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  instance_name  = var.marketing-vm_instance_name
  instance_count = var.marketing-vm_count
  image_family   = var.image_family
  public_ip      = true

  labels = { 
    owner= var.marketing-label-owner,
    project = var.marketing-label-project
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.analytics-vm_env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.develop-a_zone]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.analytics-vm_instance_name
  instance_count = var.analytics-vm_count
  image_family   = var.image_family
  public_ip      = true

  labels = { 
    owner= var.analytics-label-owner,
    project = var.analytics-label-project
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    ssh_public_key     = local.ssh_key
  }
}
