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

# ---------------------------------------------------------------------------------------------------------------------
#   TGW
# ---------------------------------------------------------------------------------------------------------------------

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "ram_resource_share_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable sharing the Transit Gateway with the Organization using Resource Access Manager (RAM)"
}

variable "ram_principal" {
  type        = string
  default     = null
  description = "The principal to associate with the resource share. Possible values are an AWS account ID, an Organization ARN, or an Organization Unit ARN. If this is not provided and `ram_resource_share_enabled` is set to `true`, the Organization ARN will be used"
}

variable "auto_accept_shared_attachments" {
  type        = string
  default     = "enable"
  description = "Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. Default value: `disable`"
}

variable "default_route_table_association" {
  type        = string
  default     = "disable"
  description = "Whether resource attachments are automatically associated with the default association route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "default_route_table_propagation" {
  type        = string
  default     = "disable"
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "dns_support" {
  type        = string
  default     = "enable"
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "vpn_ecmp_support" {
  type        = string
  default     = "enable"
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "allow_external_principals" {
  type        = bool
  default     = false
  description = "Indicates whether principals outside your organization can be associated with a resource share"
}

variable "vpc_attachment_dns_support" {
  type        = string
  default     = "enable"
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "vpc_attachment_ipv6_support" {
  type        = string
  default     = "disable"
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

# ---------------------------------------------------------------------------------------------------------------------
#   VPC_VPN
# ---------------------------------------------------------------------------------------------------------------------
variable "vpc_vpn_name" {
    description = "VPC Name"
    type        = string
}
variable "vpc_vpn_cidr" {
    description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
    type    = string
}
variable "vpc_vpn_azs" {
    description = "A list of availability zones names or ids in the region"
    type    = list(string)
}
variable "vpc_vpn_public_subnets" {
    description = "A list of public subnets inside the VPC"
    type    = list(string)
}
variable "vpc_vpn_private_subnets" {
    description = "A list of private subnets inside the VPC"
    type    = list(string)
}
variable "vpc_vpn_intra_subnets" {
    description = "A list of intra subnets"
    type    = list(string)
}
variable "vpc_vpn_public_subnet_names" {
    description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_vpn_private_subnet_names" {
    description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_vpn_intra_subnet_names" {
    description = "Explicit values to use in the Name tag on intra subnets. If empty, Name tags are generated."
    type    = list(string)
}
variable "vpc_vpn_enable_nat_gateway" {
    description = "Should be true if you want to provision NAT Gateways for each of your private networks"
    type        = bool
}
variable "vpc_vpn_single_nat_gateway" {
    description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
    type        = bool
}
variable "vpc_vpn_one_nat_gateway_per_az" {
    description = "Should be true if you want only one NAT Gateway per availability zone. Requires var.azs to be set, and the number of public_subnets created to be greater than or equal to the number of availability zones specified in var.azs."
    type        = bool
}
variable "vpc_vpn_enable_dns_hostnames" {
    description = "Should be true to enable DNS hostnames in the VPC"
    type        = bool
}
variable "vpc_vpn_enable_dns_support" {
    description = "Should be true to enable DNS support in the VPC"
    type        = bool
}

# ---------------------------------------------------------------------------------------------------------------------
#   CLIENT_VPN
# ---------------------------------------------------------------------------------------------------------------------
variable "organization_name" {
  type        = string
  description = "Name of organization to use in private certificate"
}

variable "client_cidr_block" {
  description = "Network CIDR to use for clients"
  type        = string
}

variable "logging_enabled" {
  description = "Enables or disables Client VPN Cloudwatch logging."
  type        = bool
}

variable "logging_stream_name" {
  description = "Names of stream used for logging"
  type        = string
}

variable "retention_in_days" {
  description = "Number of days you want to retain log events in the log group"
  type        = number
}

variable "vpn_name" {
  description = "Name of the vpn"
  type        = string
}

variable "authentication_type" {
  description = "One of certificate-authentication or federated-authentication"
  type        = string
}

variable "saml_provider_arn" {
  description = "Optional SAML provider ARN"
  type        = string
}

variable "split_tunnel" {
  description = "Indicates whether split-tunnel is enabled on VPN endpoint. Default value is false."
  type        = bool
}

variable "dns_servers" {
  default     = []
  type        = list(string)
  description = "(Optional) Information about the DNS servers to be used for DNS resolution. A Client VPN endpoint can have up to two DNS servers. If no DNS server is specified, the DNS address of the connecting device is used."
}