module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = var.availability_zones
}

module "security" {

  source = "./modules/security"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id

}

module "rds" {

  source = "./modules/rds"

  project_name = var.project_name

  private_subnet_ids = module.vpc.private_subnet_ids

  rds_security_group_id = module.security.rds_security_group_id

  db_username = var.db_username

  db_password = var.db_password
}

module "eks" {

  source = "./modules/eks"

  project_name = var.project_name

  eks_version = var.eks_version

  subnet_ids = module.vpc.private_subnet_ids

  eks_security_gid = module.security.rds_security_group_id

}

module "ecr" {

  source = "./modules/ecr"

  project_name = var.project_name
}

module "kms" {

  source = "./modules/kms"
}

module "secrets_manager" {

  source = "./modules/secrets-manager"

  project_name = var.project_name

  kms_key_id = module.kms.kms_key_id
}

module "ebs_csi" {

  source = "./modules/ebs-csi"

  cluster_name = module.eks.cluster_name

  oidc_provider_arn = module.eks.oidc_provider_arn

  oidc_issuer_url = module.eks.cluster_oidc_issuer_url
}

module "alb_irsa" {

  source = "./modules/alb-irsa"

  oidc_provider_arn = module.eks.oidc_provider_arn

  oidc_issuer_url = module.eks.cluster_oidc_issuer_url
}