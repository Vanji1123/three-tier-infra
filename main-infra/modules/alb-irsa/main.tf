resource "aws_iam_policy" "alb_controller" {

  name = "AWSLoadBalancerControllerIAMPolicy"

  policy = file("${path.module}/iam_policy.json")
}

resource "aws_iam_role" "alb_controller" {

  name = "AmazonEKSLoadBalancerControllerRole"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Federated = var.oidc_provider_arn
        }

        Action = "sts:AssumeRoleWithWebIdentity"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "alb_attach" {

  role = aws_iam_role.alb_controller.name

  policy_arn = aws_iam_policy.alb_controller.arn
}