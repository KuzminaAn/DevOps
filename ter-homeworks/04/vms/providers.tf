terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"

    backend "s3" {
    endpoint = "https://storage.yandexcloud.net"
      
      
    bucket = "tfstate-05"
    region = "ru-central1"
    key = "terraform.tfstate"

    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = true

    dynamodb_table = "tfstate-lock"
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g92udtl7ng3gm4flt6/etnq4j8hj7tks0mtarq5"
  }
  
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
}
