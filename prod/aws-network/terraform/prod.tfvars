
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "prod"

# ---------------------------------------------------------------------------------------------------------------------
#   VPC
# ---------------------------------------------------------------------------------------------------------------------
vpc_name                                        = "valor-prod-vpc"
vpc_cidr                                        = "10.30.0.0/16"
vpc_azs                                         = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets                             = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
vpc_public_subnets                              = ["10.30.101.0/24", "10.30.102.0/24", "10.30.103.0/24"]
vpc_database_subnets                            = ["10.30.21.0/24", "10.30.22.0/24", "10.30.23.0/24"]
vpc_elasticache_subnets                         = ["10.30.31.0/24", "10.30.32.0/24", "10.30.33.0/24"]
vpc_intra_subnets                               = ["10.30.41.0/24", "10.30.42.0/24", "10.30.43.0/24"]


vpc_private_subnet_names                        = ["prod-private-subnet-a", "prod-private-subnet-b", "prod-private-subnet-c"]
vpc_public_subnet_names                         = ["prod-public-subnet-a", "prod-public-subnet-b", "prod-public-subnet-c"]
vpc_database_subnet_names                       = ["prod-database-subnet-a", "prod-database-subnet-b", "prod-database-subnet-c"]
vpc_elasticache_subnet_names                    = ["prod-elasticache-subnet-a", "prod-elasticache-subnet-b", "prod-elasticache-subnet-c"]
vpc_intra_subnet_names                          = ["prod-tgw-subnet-a", "prod-tgw-subnet-b", "prod-tgw-subnet-c"]

vpc_enable_nat_gateway                          = true
vpc_single_nat_gateway                          = false
vpc_one_nat_gateway_per_az                      = false

vpc_enable_dns_hostnames                        = true
vpc_enable_dns_support                          = true