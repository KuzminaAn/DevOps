module "vpc_dev" {
  source         = "/home/admin/ter-homeworks/04/local-vpc/vpc"
  network_name   = var.network_name
  zone           = var.network_zone
  v4_cidr_blocks = var.network_cidr
  cloud_id       = var.cloud_id 
  folder_id      = var.folder_id 
}

output "develop_subnet_id" {
  value = module.vpc_dev.subnet_id
}
