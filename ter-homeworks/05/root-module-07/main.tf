resource "yandex_ydb_database_serverless" "tfstate-lock-test" {
  name      = var.database_name

  serverless_database {
    enable_throttling_rcu_limit = var.db_throttling_rcu_bool
    provisioned_rcu_limit       = var.db_provisioned_rcu
    storage_size_limit          = var.db_storage_size
    throttling_rcu_limit        = var.db_throttling_rcu
  }
}

resource "yandex_ydb_table" "test_table" {
  path            = var.table_path
  connection_string = yandex_ydb_database_serverless.tfstate-lock-test.ydb_full_endpoint

  column {
    name     = var.table_name
    type     = var.table_type
    not_null = var.table_null
  }

  primary_key = [var.table_key]
}

resource "yandex_iam_service_account" "service_account" {
  name = var.service_account_name
}

resource "yandex_iam_service_account_key" "key" {
  service_account_id = yandex_iam_service_account.service_account.id
}

resource "yandex_iam_service_account_iam_binding" "account_iam" {
  service_account_id = yandex_iam_service_account.service_account.id
  role               = var.account_role

  members = [
    "serviceAccount:${yandex_iam_service_account.service_account.id}",
  ]
}

resource "yandex_storage_bucket" "bucket" {
  bucket               = var.bucket_test_name
  default_storage_class = var.bucket_default_storage_class
  max_size              = var.bucket_max_size
}
