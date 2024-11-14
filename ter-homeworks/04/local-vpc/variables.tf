variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "network_name" {
  type        = string
  default = "develop-network"
}

variable "network_zone" {
  type        = string
  default = "ru-central1-a"
}

variable "network_cidr" {
  type        = string
  default = "10.0.1.0/24"
}
