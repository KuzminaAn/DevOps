variable "ha" {
  type        = bool
  default     = false
}

variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "mysql_cluster_name" {
  type        = string
  default     = "example-cluster"
}

variable "mysql_database_name" {
  type        = string
  default     = "test"
}

variable "mysql_username" {
  type        = string
  default     = "app"
}
