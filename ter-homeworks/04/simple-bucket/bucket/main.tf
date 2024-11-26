resource "yandex_storage_bucket" "bucket" {
  bucket = var.bucket
  default_storage_class = var.storage_class
  max_size = var.size

  lifecycle {
    prevent_destroy = true
  }
}
