
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "dev"

# ---------------------------------------------------------------------------------------------------------------------
#   VPC
# ---------------------------------------------------------------------------------------------------------------------
vpc_name                                        = "valor-dev-vpc"
vpc_cidr                                        = "10.10.0.0/16"
vpc_azs                                         = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets                             = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
vpc_public_subnets                              = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
vpc_database_subnets                            = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24"]
vpc_elasticache_subnets                         = ["10.10.31.0/24", "10.10.32.0/24", "10.10.33.0/24"]
vpc_intra_subnets                               = ["10.10.41.0/24", "10.10.42.0/24", "10.10.43.0/24"]


vpc_private_subnet_names                        = ["dev-private-subnet-a", "dev-private-subnet-b", "dev-private-subnet-c"]
vpc_public_subnet_names                         = ["dev-public-subnet-a", "dev-public-subnet-b", "dev-public-subnet-c"]
vpc_database_subnet_names                       = ["dev-database-subnet-a", "dev-database-subnet-b", "dev-database-subnet-c"]
vpc_elasticache_subnet_names                    = ["dev-elasticache-subnet-a", "dev-elasticache-subnet-b", "dev-elasticache-subnet-c"]
vpc_intra_subnet_names                          = ["dev-tgw-subnet-a", "dev-tgw-subnet-b", "dev-tgw-subnet-c"]

vpc_enable_nat_gateway                          = true
vpc_single_nat_gateway                          = false
vpc_one_nat_gateway_per_az                      = false

vpc_enable_dns_hostnames                        = true
vpc_enable_dns_support                          = true