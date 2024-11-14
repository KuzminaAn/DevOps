resource "yandex_mdb_mysql_cluster" "mysql_cluster" {
  name       = var.cluster_name
  network_id = var.network_id

  environment = "PRODUCTION"
  version     = "8.0"

  host {
    name = "${var.cluster_name}-host-1"
    zone = var.host_zone
  }

  resources {      
      resource_preset_id = var.preset_id
      disk_size       = var.disk_size
      disk_type_id    = var.disk_id
      }

  dynamic "host" {
    for_each = var.ha ? [1] : []
    content {
      name = "${var.cluster_name}-host-2"
      zone = var.ha_host_zone
    }
  }
}

output "cluster_id" {
  value = yandex_mdb_mysql_cluster.mysql_cluster.id
}