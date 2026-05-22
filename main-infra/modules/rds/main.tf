resource "aws_db_subnet_group" "rds_subnet_group" {

  name = "rds-${var.project_name}-db-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "rds-${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {

  identifier = "rds-${var.project_name}-db"

  allocated_storage = 20

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  db_name = "userdb"

  username = var.db_username

  password = var.db_password

  publicly_accessible = false

  multi_az = false

  storage_encrypted = true

  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  backup_retention_period = 0

  deletion_protection = false

  tags = {
    Name = "rds-${var.project_name}-rds"
  }
}