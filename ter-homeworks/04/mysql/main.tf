provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
}

module "network" {  
    source = "./network"
    }

module "mysql_cluster" {
  source      = "./mysql_cluster"
  cluster_name = var.mysql_cluster_name
  network_id  = module.network.network_id
  ha          = false
}

module "mysql_db_user" {
  source        = "./mysql_user_db"
  database_name = var.mysql_database_name
  username      = var.mysql_username
  cluster_id    = module.mysql_cluster.cluster_id
}
