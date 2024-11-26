###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "image_family" {
  type = string
  default = "ubuntu-2204-lts"
}

variable "vm_web_count" {
  type = number
  default = 2
}

variable "vm_web_name" {
  type = string
  default = "web"
}

variable "vm_web_hostname" {   
  type        = string  
  default     = ""
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v2"
}

variable "vm_web_cores" {
  type = number
  default = 2
}

variable "vm_web_memory" {
  type = number
  default = 1
}

variable "vm_web_core_fraction" {
  type = number
  default = 5
}

variable "vm_web_size" {
  type = number
  default = 10
}

variable "each_vm" {
  type = list(object({
    vm_name       = string
    cpu           = number
    ram           = number
    size          = number
    core_fraction = number
  }))
  default = [
    {
      vm_name       = "main"
      cpu           = 4
      ram           = 8
      size          = 20
      core_fraction = 20
    },
    {
      vm_name       = "replica"
      cpu           = 2
      ram           = 2
      size          = 10
      core_fraction = 5
    }
  ]
}

variable "disk_name" {
  type = string
  default = "disk"
}

variable "disk_size" {
  type = number
  default = 1
}

variable "storage_name" {
  type        = string
  default     = "storage"
}

variable "storage_hostname" {
  type        = string
  default     = "storage"
}


variable "storage_cores" {
  type = number
  default = 2
}

variable "storage_memory" {
  type = number
  default = 2
}

variable "storage_core_fraction" {
  type = number
  default = 5
}

variable "storage_size" {
  type = number
  default = 10
}

variable "vm_fqdn" {
    default = "internal"
    type        = string
}
