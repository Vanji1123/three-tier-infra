variable "project_name" {}

variable "private_subnet_ids" {
  type = list(string)
}

variable "rds_security_group_id" {}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}