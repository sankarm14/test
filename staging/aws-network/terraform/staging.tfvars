
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "staging"

# ---------------------------------------------------------------------------------------------------------------------
#   VPC
# ---------------------------------------------------------------------------------------------------------------------
vpc_name                                        = "valor-staging-vpc"
vpc_cidr                                        = "10.20.0.0/16"
vpc_azs                                         = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets                             = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
vpc_public_subnets                              = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]
vpc_database_subnets                            = ["10.20.21.0/24", "10.20.22.0/24", "10.20.23.0/24"]
vpc_elasticache_subnets                         = ["10.20.31.0/24", "10.20.32.0/24", "10.20.33.0/24"]
vpc_intra_subnets                               = ["10.20.41.0/24", "10.20.42.0/24", "10.20.43.0/24"]


vpc_private_subnet_names                        = ["staging-private-subnet-a", "staging-private-subnet-b", "staging-private-subnet-c"]
vpc_public_subnet_names                         = ["staging-public-subnet-a", "staging-public-subnet-b", "staging-public-subnet-c"]
vpc_database_subnet_names                       = ["staging-database-subnet-a", "staging-database-subnet-b", "staging-database-subnet-c"]
vpc_elasticache_subnet_names                    = ["staging-elasticache-subnet-a", "staging-elasticache-subnet-b", "staging-elasticache-subnet-c"]
vpc_intra_subnet_names                          = ["staging-tgw-subnet-a", "staging-tgw-subnet-b", "staging-tgw-subnet-c"]

vpc_enable_nat_gateway                          = true
vpc_single_nat_gateway                          = false
vpc_one_nat_gateway_per_az                      = false

vpc_enable_dns_hostnames                        = true
vpc_enable_dns_support                          = true