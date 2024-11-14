variable "network_name" {
  type        = string
  default = "my-network"
}

variable "subnet_name" {
  type        = string
  default = "my-subnet"
}

variable "subnet_cidr" {
  type        = string
  default = "10.0.0.0/24"
}

variable "subnet_zone" {
  type        = string
  default = "ru-central1-a"
}