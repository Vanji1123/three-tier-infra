variable "project_name" {}

variable "eks_version" {}

variable "subnet_ids" {
  type = list(string)
}

variable "eks_security_gid" {}