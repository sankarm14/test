module "vpc" {
    
  source = "../../../_modules/vpc"

  name                      = var.vpc_name
  cidr                      = var.vpc_cidr


  azs                       = var.vpc_azs

  private_subnets           = var.vpc_private_subnets
  public_subnets            = var.vpc_public_subnets
  database_subnets          = var.vpc_database_subnets
  elasticache_subnets       = var.vpc_elasticache_subnets
  intra_subnets             = var.vpc_intra_subnets

  private_subnet_names      = var.vpc_private_subnet_names
  public_subnet_names       = var.vpc_public_subnet_names
  database_subnet_names     = var.vpc_database_subnet_names
  elasticache_subnet_names  = var.vpc_elasticache_subnet_names
  intra_subnet_names        = var.vpc_intra_subnet_names
  
  enable_nat_gateway        = var.vpc_enable_nat_gateway
  single_nat_gateway        = var.vpc_single_nat_gateway
  one_nat_gateway_per_az    = var.vpc_one_nat_gateway_per_az
  
  enable_dns_hostnames      = var.vpc_enable_dns_hostnames
  enable_dns_support        = var.vpc_enable_dns_support
  

  tags = {
    Environment = var.env_name
  }
  
  providers = {
    aws = aws.dev
  }
  
}