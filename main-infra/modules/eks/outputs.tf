output "cluster_name" {

  value = aws_eks_cluster.main_cluster.name
}

output "cluster_endpoint" {

  value = aws_eks_cluster.main_cluster.endpoint
}

output "cluster_certificate_authority_data" {

  value = aws_eks_cluster.main_cluster.certificate_authority[0].data
}

output "oidc_provider_arn" {

  value = aws_iam_openid_connect_provider.eks.arn
}

output "cluster_oidc_issuer_url" {

  value = aws_eks_cluster.main_cluster.identity[0].oidc[0].issuer
}


output "cluster_security_group_id" {
  value = aws_eks_cluster.main_cluster.vpc_config[0].cluster_security_group_id
}