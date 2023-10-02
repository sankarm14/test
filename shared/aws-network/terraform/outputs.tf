# ---------------------------------------------------------------------------------------------------------------------
#   VPC
# ---------------------------------------------------------------------------------------------------------------------
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.vpc.default_security_group_id
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.vpc.default_network_acl_id
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = module.vpc.default_route_table_id
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.vpc.vpc_enable_dns_support
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.vpc.vpc_enable_dns_hostnames
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = module.vpc.vpc_main_route_table_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "database_subnet_arns" {
  description = "List of ARNs of database subnets"
  value       = module.vpc.database_subnet_arns
}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "elasticache_subnets" {
  description = "List of IDs of elasticache subnets"
  value       = module.vpc.elasticache_subnets
}

output "elasticache_subnet_arns" {
  description = "List of ARNs of elasticache subnets"
  value       = module.vpc.elasticache_subnet_arns
}

output "elasticache_subnets_cidr_blocks" {
  description = "List of cidr_blocks of elasticache subnets"
  value       = module.vpc.elasticache_subnets_cidr_blocks
}

output "intra_subnets" {
  description = "List of IDs of intra subnets"
  value       = module.vpc.intra_subnets
}

output "intra_subnet_arns" {
  description = "List of ARNs of intra subnets"
  value       = module.vpc.intra_subnet_arns
}

output "intra_subnets_cidr_blocks" {
  description = "List of cidr_blocks of intra subnets"
  value       = module.vpc.intra_subnets_cidr_blocks
}

output "intra_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of intra subnets in an IPv6 enabled VPC"
  value       = module.vpc.intra_subnets_ipv6_cidr_blocks
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.vpc.private_route_table_ids
}

output "database_route_table_ids" {
  description = "List of IDs of database route tables"
  value       = module.vpc.database_route_table_ids
}

output "elasticache_route_table_ids" {
  description = "List of IDs of elasticache route tables"
  value       = module.vpc.elasticache_route_table_ids
}

output "intra_route_table_ids" {
  description = "List of IDs of intra route tables"
  value       = module.vpc.intra_route_table_ids
}

# ---------------------------------------------------------------------------------------------------------------------
#   TGW
# ---------------------------------------------------------------------------------------------------------------------

output "transit_gateway_arn" {
  value       = module.transit_gateway.transit_gateway_arn
  description = "Transit Gateway ARN"
}

output "transit_gateway_id" {
  value       = module.transit_gateway.transit_gateway_id
  description = "Transit Gateway ID"
}

output "transit_gateway_route_table_id" {
  value       = module.transit_gateway.transit_gateway_route_table_id
  description = "Transit Gateway route table ID"
}

output "transit_gateway_vpc_attachment_id_prod" {
  value       = module.transit_gateway_vpc_attachments_and_subnet_routes_prod.transit_gateway_vpc_attachment_ids["prod"]
  description = "Prod Transit Gateway VPC attachment ID"
}

output "transit_gateway_vpc_attachment_id_staging" {
  value       = module.transit_gateway_vpc_attachments_and_subnet_routes_staging.transit_gateway_vpc_attachment_ids["staging"]
  description = "Staging Transit Gateway VPC attachment ID"
}

output "transit_gateway_vpc_attachment_id_dev" {
  value       = module.transit_gateway_vpc_attachments_and_subnet_routes_dev.transit_gateway_vpc_attachment_ids["dev"]
  description = "Dev Transit Gateway VPC attachment ID"
}

output "transit_gateway_route_ids_prod" {
  value       = try(module.transit_gateway.transit_gateway_route_ids["prod"], {})
  description = "Prod Transit Gateway route identifiers combined with destinations"
}

output "transit_gateway_route_ids_staging" {
  value       = try(module.transit_gateway.transit_gateway_route_ids["staging"], {})
  description = "Staging Transit Gateway route identifiers combined with destinations"
}

output "transit_gateway_route_ids_dev" {
  value       = try(module.transit_gateway.transit_gateway_route_ids["dev"], {})
  description = "Dev Transit Gateway route identifiers combined with destinations"
}

output "subnet_route_ids_prod" {
  value       = try(module.transit_gateway_vpc_attachments_and_subnet_routes_prod.subnet_route_ids["prod"], {})
  description = "Prod subnet route identifiers combined with destinations"
}

output "subnet_route_ids_staging" {
  value       = try(module.transit_gateway_vpc_attachments_and_subnet_routes_staging.subnet_route_ids["staging"], {})
  description = "Staging subnet route identifiers combined with destinations"
}

output "subnet_route_ids_dev" {
  value       = try(module.transit_gateway_vpc_attachments_and_subnet_routes_dev.subnet_route_ids["dev"], {})
  description = "Dev subnet route identifiers combined with destinations"
}

# ---------------------------------------------------------------------------------------------------------------------
#   VPC_VPN
# ---------------------------------------------------------------------------------------------------------------------
output "vpc_vpn_id" {
  description = "The ID of the VPC"
  value       = module.vpc_vpn.vpc_id
}

output "vpc_vpn_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc_vpn.vpc_arn
}

output "vpc_vpn_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc_vpn.vpc_cidr_block
}

output "default_security_group_id_vpn" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.vpc_vpn.default_security_group_id
}

output "default_network_acl_id_vpn" {
  description = "The ID of the default network ACL"
  value       = module.vpc_vpn.default_network_acl_id
}

output "default_route_table_id_vpn" {
  description = "The ID of the default route table"
  value       = module.vpc_vpn.default_route_table_id
}

output "vpc_vpn_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.vpc_vpn.vpc_enable_dns_support
}

output "vpc_vpn_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.vpc_vpn.vpc_enable_dns_hostnames
}

output "vpc_vpn_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = module.vpc_vpn.vpc_main_route_table_id
}

output "private_subnets_vpn" {
  description = "List of IDs of private subnets"
  value       = module.vpc_vpn.private_subnets
}

output "private_subnet_arns_vpn" {
  description = "List of ARNs of private subnets"
  value       = module.vpc_vpn.private_subnet_arns
}

output "private_subnets_cidr_blocks_vpn" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc_vpn.private_subnets_cidr_blocks
}

output "intra_subnets_vpn" {
  description = "List of IDs of intra subnets"
  value       = module.vpc_vpn.intra_subnets
}

output "intra_subnet_arns_vpn" {
  description = "List of ARNs of intra subnets"
  value       = module.vpc_vpn.intra_subnet_arns
}

output "intra_subnets_cidr_blocks_vpn" {
  description = "List of cidr_blocks of intra subnets"
  value       = module.vpc_vpn.intra_subnets_cidr_blocks
}

output "intra_subnets_ipv6_cidr_blocks_vpn" {
  description = "List of IPv6 cidr_blocks of intra subnets in an IPv6 enabled VPC"
  value       = module.vpc_vpn.intra_subnets_ipv6_cidr_blocks
}

output "private_route_table_ids_vpn" {
  description = "List of IDs of private route tables"
  value       = module.vpc_vpn.private_route_table_ids
}

output "intra_route_table_ids_vpn" {
  description = "List of IDs of intra route tables"
  value       = module.vpc_vpn.intra_route_table_ids
}

# ---------------------------------------------------------------------------------------------------------------------
#   ROUTE53
# ---------------------------------------------------------------------------------------------------------------------
output "zone_id" {
  description = "route53 zone id"
  value       = try(module.route53.zone["shared.valoraws.com"].zone_id, null)
}