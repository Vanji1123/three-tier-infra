output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "db_endpoint" {

  value = module.rds.db_endpoint
}

output "db_name" {

  value = module.rds.db_name
}

output "cluster_name" {

  value = module.eks.cluster_name
}


output "alb_role_arn" {

  value = module.alb_irsa.alb_role_arn
}