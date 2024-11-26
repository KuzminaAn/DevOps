variable "cloud_id" {
    type        = string
}

variable "folder_id" {
    type        = string
}

variable "service_account_name" {
    type        = string
    default = "tfstate-terraform"
}

variable "bucket_name" {
    type        = string
    default = "test-bucket-terraform"
}

variable "database_name" {
    type = string
    default = "test-ydb-serverless"
}

variable "account_role" {
    type = string
    default = "ydb.editor"
}

variable "bucket_test_name" {
    type = string
    default = "bucket-test-new-unique-name"
}

variable "bucket_default_storage_class" {
    type = string
    default = "STANDARD"
}

variable "bucket_max_size" {
    type = number
    default = 1
}

variable "db_throttling_rcu_bool" {
    type = bool
    default = true
}

variable "db_provisioned_rcu" {
    type = number
    default = 0
}

variable "db_storage_size" {
    type = number
    default = 1
}

variable "db_throttling_rcu" {
    type = number
    default = 10
}

variable "table_name" {
    type = string
    default = "testID"    
}

variable "table_type" {
    type = string
    default = "Utf8"
}

variable "table_null" {
    type = bool
    default = true
}

variable "table_key" {
    type = string
    default = "testID"
}

variable "table_path" {
    type = string
    default = "test-ydb-serverless/test-tfstate-lock-table"
}
