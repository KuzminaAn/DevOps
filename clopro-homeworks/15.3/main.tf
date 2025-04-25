resource "yandex_storage_bucket" "bucket" {
  bucket = var.bucket.name
  acl    = var.bucket.acl

  website {
    index_document = var.bucket.index_document
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket-key.id
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
}

resource "yandex_kms_symmetric_key" "bucket-key" {
  name              = var.bucket_symmetric_key.name
  default_algorithm = var.bucket_symmetric_key.default_algorithm
  rotation_period   = var.bucket_symmetric_key.rotation_period
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.bucket.bucket
  key    = var.storage_object.key
  source = var.storage_object.source
  acl    = var.storage_object.acl
}