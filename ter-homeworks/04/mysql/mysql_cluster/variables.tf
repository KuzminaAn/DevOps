variable "cluster_name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "ha" {
  type    = bool
  default = false
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "host_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "ha_host_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "preset_id" {
  type    = string
  default = "s2.micro"
}

variable "disk_id" {
  type    = string
  default = "network-ssd"
}
