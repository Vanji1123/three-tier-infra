resource "aws_security_group" "rds_sg" {

  name = "${var.project_name}-rds-sg"

  description = "RDS Security Group"

  vpc_id = var.vpc_id

  ingress {

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    security_groups = [var.eks_security_gid]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-rds-sg"
  }
}