variable "aws_region" {}

variable "project_name" {}

variable "vpc_cidr" {}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "eks_version" {}

variable "aws_access_key" {

  sensitive = true
}

variable "aws_secret_key" {

  sensitive = true
}
