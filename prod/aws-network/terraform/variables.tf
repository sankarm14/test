# ---------------------------------------------------------------------------------------------------------------------
#   Env. Info
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
    description = "The name of the selected region."
    type        = string
    default = "us-east-1"
}
variable "env_name" {
    description = "Environment Name"
    type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
#   VPC
# ---------------------------------------------------------------------------------------------------------------------
variable "vpc_name" {
    description = "VPC Name"
    type        = string
}
variable "vpc_cidr" {
    description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
    type    = string
}
variable "vpc_azs" {
    description = "A list of availability zones names or ids in the region"
    type    = list(string)
}
variable "vpc_private_subnets" {
    description = "A list of private subnets inside the VPC"
    type    = list(string)
}
variable "vpc_public_subnets" {
    description = "A list of public subnets inside the VPC"
    type    = list(string)
}
variable "vpc_database_subnets" {
    description = "A list of database subnets"
    type    = list(string)
}
variable "vpc_elasticache_subnets" {
    description = "A list of elasticache subnets"
    type    = list(string)
}
variable "vpc_intra_subnets" {
    description = "A list of intra subnets"
    type    = list(string)
}
variable "vpc_private_subnet_names" {
    description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_public_subnet_names" {
    description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_database_subnet_names" {
    description = "Explicit values to use in the Name tag on database subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_elasticache_subnet_names" {
    description = "Explicit values to use in the Name tag on elasticache subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_intra_subnet_names" {
    description = "Explicit values to use in the Name tag on intra subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_enable_nat_gateway" {
    description = "Should be true if you want to provision NAT Gateways for each of your private networks"
    type        = bool
}
variable "vpc_single_nat_gateway" {
    description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
    type        = bool
}
variable "vpc_one_nat_gateway_per_az" {
    description = "Should be true if you want only one NAT Gateway per availability zone. Requires var.azs to be set, and the number of public_subnets created to be greater than or equal to the number of availability zones specified in var.azs."
    type        = bool
}
variable "vpc_enable_dns_hostnames" {
    description = "Should be true to enable DNS hostnames in the VPC"
    type        = bool
}
variable "vpc_enable_dns_support" {
    description = "Should be true to enable DNS support in the VPC"
    type        = bool
}
