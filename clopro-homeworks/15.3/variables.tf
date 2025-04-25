variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "bucket" {
  type = object({
    name = string
    acl = string
    index_document = string
  })
  default = {
    name = "secure-kms-bucket"
    acl = "public-read"
    index_document = "index.html"
  }
}

variable "storage_object" {
  type = object({
    key = string
    source = string
    acl = string
  })
  default = {
    key = "joke"
    source = "./joke.png"
    acl = "public-read"
  }
}

variable "sse_algorithm" {
  type        = string
  default = "aws:kms"
}

variable "bucket_symmetric_key" {
  type = object({
    name = string
    default_algorithm = string
    rotation_period = string
  })
  default = {
    name = "bucket-symetric-key"
    default_algorithm = "AES_128"
    rotation_period = "2160h"
  }
}
