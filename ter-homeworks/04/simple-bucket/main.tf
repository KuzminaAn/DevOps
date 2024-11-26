resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source = "/home/admin/ter-homeworks/04/simple-bucket/bucket"
  bucket = "simple-bucket-${random_string.unique_id.result}"
  storage_class = var.storage_class
  size = var.size
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}
