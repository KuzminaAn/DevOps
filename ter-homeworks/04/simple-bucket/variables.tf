variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "storage_class" {
  type        = string
  default = "STANDARD"
}

variable "size" {
  type        = number
  default = 1
}
