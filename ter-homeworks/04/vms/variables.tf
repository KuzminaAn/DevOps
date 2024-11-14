###cloud vars

variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
}

variable "develop_a_name" {
  type        = string
  default     = "develop-ru-central1-a"
}

variable "develop_b_name" {
  type        = string
  default     = "develop-ru-central1-b"
}

variable "develop-a_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "develop-b_zone" {
  type        = string
  default     = "ru-central1-b"
}

variable "develop-a_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "develop-b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "image_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "marketing-vm_count" {
  type = number
  default = 1
}

variable "analytics-vm_count" {
  type = number
  default = 1
}

variable "marketing-vm_env_name" {
  type = string
  default = "marketing"
}

variable "marketing-vm_instance_name" {
  type = string
  default = "marketing-vm"
}

variable "analytics-vm_env_name" {
  type = string
  default = "analytics"
}

variable "analytics-vm_instance_name" {
  type = string
  default = "analytics-vm"
}

variable "marketing-label-owner" {
  type = string
  default = "marketing-admin"
}

variable "marketing-label-project" {
  type = string
  default = "marketing"
}

variable "analytics-label-owner" {
  type = string
  default = "analytics-admin"
}

variable "analytics-label-project" {
  type = string
  default = "analytics"
}
