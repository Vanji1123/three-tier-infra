resource "aws_kms_key" "main" {

  description = "KMS key for DevOps Project"

  deletion_window_in_days = 7

  enable_key_rotation = true

  tags = {
    Name = "devops-kms-key"
  }
}

resource "aws_kms_alias" "main_alias" {

  name = "alias/devops-kms"

  target_key_id = aws_kms_key.main.key_id
}