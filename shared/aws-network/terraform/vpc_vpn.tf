module "vpc_vpn" {
    
  source = "../../../_modules/vpc"

  name                      = var.vpc_vpn_name
  cidr                      = var.vpc_vpn_cidr


  azs                       = var.vpc_vpn_azs

  public_subnets            = var.vpc_vpn_public_subnets
  private_subnets           = var.vpc_vpn_private_subnets
  intra_subnets             = var.vpc_vpn_intra_subnets

  public_subnet_names       = var.vpc_vpn_public_subnet_names
  private_subnet_names      = var.vpc_vpn_private_subnet_names
  intra_subnet_names        = var.vpc_vpn_intra_subnet_names
  
  enable_nat_gateway        = var.vpc_vpn_enable_nat_gateway
  single_nat_gateway        = var.vpc_vpn_single_nat_gateway
  one_nat_gateway_per_az    = var.vpc_vpn_one_nat_gateway_per_az
  
  enable_dns_hostnames      = var.vpc_vpn_enable_dns_hostnames
  enable_dns_support        = var.vpc_vpn_enable_dns_support
  

  tags = {
    Environment = var.env_name
  }
  
  providers = {
    aws = aws.network
  }
}