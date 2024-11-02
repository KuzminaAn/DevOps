###cloud vars


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
  description = "VPC network & subnet name"
}

# Вторая ВМ
variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["192.168.0.0/24"]
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "database"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0QHjqSV/DqDZsZZbAD4fEPYgJlASDS/08v6Nsi0ILX admin@terraform-2"
  description = "ssh-keygen -t ed25519"
}

# output

variable "vm_web_fqdn" {
  type        = string
  default     = "netology-develop-platform-web.ru-central1.internal"
}

variable "vm_db_fqdn" {
  type        = string
  default     = "netology-develop-platform-db.ru-central1.internal"
}

# local

variable "project" {
  type        = string
  default     = "netology"
}

variable "env_web" {
  type        = string
  default     = "develop-platform-web"
}

variable "env_db" {
  type        = string
  default     = "develop-platform-db"
}

# Задание 8*

variable "test" {
  description = "Список серверов с SSH-доступом и IP-адресами"
  type = list(object({
    dev1 = optional(list(string))  # Делаем ключи необязательными
    dev2 = optional(list(string))
    prod1 = optional(list(string))
  }))
}
