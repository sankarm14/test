
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "shared"

# ---------------------------------------------------------------------------------------------------------------------
#   VPC
# ---------------------------------------------------------------------------------------------------------------------
vpc_name                                        = "valor-shared-vpc"
vpc_cidr                                        = "10.0.0.0/16"
vpc_azs                                         = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets                             = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
vpc_public_subnets                              = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
vpc_database_subnets                            = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
vpc_elasticache_subnets                         = ["10.0.31.0/24", "10.0.32.0/24", "10.0.33.0/24"]
vpc_intra_subnets                               = ["10.0.41.0/24", "10.0.42.0/24", "10.0.43.0/24"]


vpc_private_subnet_names                        = ["shared-private-subnet-a", "shared-private-subnet-b", "shared-private-subnet-c"]
vpc_public_subnet_names                         = ["shared-public-subnet-a", "shared-public-subnet-b", "shared-public-subnet-c"]
vpc_database_subnet_names                       = ["shared-database-subnet-a", "shared-database-subnet-b", "shared-database-subnet-c"]
vpc_elasticache_subnet_names                    = ["shared-elasticache-subnet-a", "shared-elasticache-subnet-b", "shared-elasticache-subnet-c"]
vpc_intra_subnet_names                          = ["shared-tgw-subnet-a", "shared-tgw-subnet-b", "shared-tgw-subnet-c"]

vpc_enable_nat_gateway                          = true
vpc_single_nat_gateway                          = false
vpc_one_nat_gateway_per_az                      = false

vpc_enable_dns_hostnames                        = true
vpc_enable_dns_support                          = true


# ---------------------------------------------------------------------------------------------------------------------
#   TGW
# ---------------------------------------------------------------------------------------------------------------------
enabled                                         = true
availability_zones                              = ["us-east-1a", "us-east-1b", "us-east-1c"]
namespace                                       = "valor"
stage                                           = "network"
name                                            = "tgw"

# ---------------------------------------------------------------------------------------------------------------------
#   VPC_VPN
# ---------------------------------------------------------------------------------------------------------------------
vpc_vpn_name                                    = "valor-shared-vpn-vpc"
vpc_vpn_cidr                                    = "10.40.0.0/16"
vpc_vpn_azs                                     = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_vpn_public_subnets                          = ["10.40.101.0/24", "10.40.102.0/24", "10.40.103.0/24"]
vpc_vpn_private_subnets                         = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24"]
vpc_vpn_intra_subnets                           = ["10.40.41.0/24", "10.40.42.0/24", "10.40.43.0/24"]

vpc_vpn_public_subnet_names                     = ["shared-vpn-public-subnet-a", "shared-vpn-public-subnet-b", "shared-vpn-public-subnet-c"]
vpc_vpn_private_subnet_names                    = ["shared-vpn-subnet-a", "shared-vpn-subnet-b", "shared-vpn-subnet-c"]
vpc_vpn_intra_subnet_names                      = ["shared-vpn-tgw-subnet-a", "shared-vpn-tgw-subnet-b", "shared-vpn-tgw-subnet-c"]

vpc_vpn_enable_nat_gateway                      = true
vpc_vpn_single_nat_gateway                      = true
vpc_vpn_one_nat_gateway_per_az                  = false

vpc_vpn_enable_dns_hostnames                    = true
vpc_vpn_enable_dns_support                      = true

# ---------------------------------------------------------------------------------------------------------------------
#   CLIENT_VPN
# ---------------------------------------------------------------------------------------------------------------------
vpn_name                                        = "ValorVPN"
client_cidr_block                               = "10.50.0.0/22"
organization_name                               = "valor"
logging_enabled                                 = "true"
logging_stream_name                             = "ValorClientVPN"
retention_in_days                               = 30
authentication_type                             = "federated-authentication"
saml_provider_arn                               = "arn:aws:iam::645187175327:saml-provider/ValorVPN"
split_tunnel                                    = true
dns_servers                                     = ["10.40.0.2"]