resource "random_password" "user_password" {
  length           = 12 
  special          = true
}

resource "yandex_mdb_mysql_database" "test_db" {
  name      = var.database_name
  cluster_id = var.cluster_id
}

resource "yandex_mdb_mysql_user" "user" {
  name      = var.username
  cluster_id = var.cluster_id
  password  = random_password.user_password.result 
  permission {
    database_name = yandex_mdb_mysql_database.test_db.name
    roles          = ["ALL"]
  }
}
