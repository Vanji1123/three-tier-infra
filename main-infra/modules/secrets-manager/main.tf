resource "aws_secretsmanager_secret" "db_secret" {

  name = "${var.project_name}-db-secret"

  kms_key_id = var.kms_key_id
}

resource "aws_secretsmanager_secret_version" "db_secret_value" {

  secret_id = aws_secretsmanager_secret.db_secret.id

  secret_string = jsonencode({

    username = "admin"

    password = "Admin@123"
  })
}