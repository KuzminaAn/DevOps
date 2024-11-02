# Первая ВМ

variable "image_family" {
  type = string
  default = "ubuntu-2004-lts"
}

# variable "vm_web_name" {
#   type = string
#   default = "netology-develop-platform-web"
# }

variable "vm_web_hostname" {
  type = string
  default = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v2"
}

# variable "vm_web_cores" {
#   type = number
#   default = 2
# }

# variable "vm_web_memory" {
#   type = number
#   default = 1
# }

# variable "vm_web_core_fraction" {
#   type = number
#   default = 5
# }

# Вторая ВМ

# variable "vm_db_name" {
#   type = string
#   default = "netology-develop-platform-db"
# }

variable "vm_db_hostname" {
  type = string
  default = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type = string
  default = "standard-v2"
}

# variable "vm_db_cores" {
#   type = number
#   default = 2
# }

# variable "vm_db_memory" {
#   type = number
#   default = 2
# }

# variable "vm_db_core_fraction" {
#   type = number
#   default = 20
# }

variable "vms_resources" {
  description = "Ресурсы для ВМ"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    },
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "vms_metadata" {
  description = "Метаданные"
  type = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = null
  }
}
