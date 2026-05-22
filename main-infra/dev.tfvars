aws_region = "ap-south-1"

project_name = "3-tier-app"

vpc_cidr = "10.0.0.0/16"

eks_version = "1.30"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

db_username = "admin"
db_password = "vanji1123"
