resource "yandex_storage_bucket" "bucket" {
  bucket = var.bucket.name
  acl    = var.bucket.acl

  website {
    index_document = var.bucket.index_document
  }
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.bucket.bucket
  key    = var.storage_object.key
  source = var.storage_object.source
  acl    = var.storage_object.acl
}