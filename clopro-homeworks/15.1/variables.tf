variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "vpc_name" {
  type        = string
  default     = "my_network"
}

variable "subnet_public_name" {
  type        = string
  default     = "public"
}

variable "subnet_private_name" {
  type        = string
  default     = "private"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-b"
}

variable "v4_cidr_public" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
}

variable "v4_cidr_private" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
}

variable "default_platform_id" {
  type        = string
  default     = "standard-v3"
}

variable "nat_name" {
  type        = string
  default     = "nat-instance"
}

variable "nat_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
}

variable "nat_instance_ip_address" {
  type        = string
  default     = "192.168.10.254"
}

variable "nat_instance_resources" {
  type = object({
    cores  = number
    memory = number
  })
  default = {
    cores  = 2
    memory = 2
  }
}

variable "private_rt_name" {
  type        = string
  default     = "private-route-table"
}

variable "private_rt_route" {
  type = object({
    destination_prefix  = string
    next_hop_address = string
  })
  default = {
    destination_prefix  = "0.0.0.0/0"
    next_hop_address = "192.168.10.254"
  }
}

variable "vm_image_id" {
  type        = string
  default     = "fd8vmcue7aajpmeo39kk"
}

variable "public_vm_name" {
  type        = string
  default     = "public_vm"
}

variable "private_vm_name" {
  type        = string
  default     = "private_vm"
}

variable "public_vm_resources" {
  type = object({
    cores  = number
    memory = number
    core_fraction = number
  })
  default = {
    cores  = 2
    memory = 2
    core_fraction = 20
  }
}

variable "private_vm_resources" {
  type = object({
    cores  = number
    memory = number
    core_fraction = number
  })
  default = {
    cores  = 2
    memory = 2
    core_fraction = 20
  }
}