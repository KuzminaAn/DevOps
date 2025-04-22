variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "account" {
  type        = string
}

variable "vpc_name" {
  type        = string
  default     = "my-network"
}

variable "subnet_name" {
  type        = string
  default     = "my-subnet"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "v4_cidr_blocks" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
}

variable "bucket" {
  type = object({
    name = string
    acl = string
    index_document = string
  })
  default = {
    name = "bucket-with-image"
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

variable "default_platform_id" {
  type        = string
  default     = "standard-v3"
}

variable "lamp_group_name" {
  type        = string
  default     = "lamp-instance-group"
}

variable "instance_group_resources" {
  type = object({
    cores  = number
    memory = number
  })
  default = {
    cores  = 2
    memory = 2
  }
}

variable "instance_group_disk" {
  type = object({
    image_id  = string
    size = number
  })
  default = {
    image_id  = "fd827b91d99psvq5fjit"
    size = 10
  }
}

variable "scale_size" {
  type        = number
  default     = 3
}

variable "deploy_policy" {
  type = object({
    max_unavailable  = number
    max_expansion = number
  })
  default = {
    max_unavailable  = 1
    max_expansion = 0
  }
}

variable "instance_group_health_check" {
  type = object({
    interval  = number
    timeout = number
    unhealthy_threshold  = number
    healthy_threshold = number
    http_path = string
    http_port = number
  })
  default = {
    interval  = 30
    timeout  = 10
    unhealthy_threshold = 5
    healthy_threshold = 3
    http_path = "/"
    http_port = 80
  }
}

variable "target_group_name" {
  type        = string
  default     = "network-lb-target-group"
}

variable "target_group_region_id" {
  type        = string
  default     = "ru-central1"
}

variable "lb_network_name" {
  type        = string
  default     = "network-lb"
}

variable "lb_network_listener" {
  type = object({
    name = string
    port = number
    ip_version = string
  })
  default = {
    name = "http-listener"
    port = 80
    ip_version = "ipv4"
  }
}

variable "target_group_health_check" {
  type = object({
    name = string
    interval  = number
    timeout = number
    unhealthy_threshold  = number
    healthy_threshold = number
    path = string
    port = number
  })
  default = {
    name = "http"
    interval  = 2
    timeout  = 3
    unhealthy_threshold = 2
    healthy_threshold = 3
    path = "/"
    port = 80
  }
}