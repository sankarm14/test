module "ec2_client_vpn" {
  source = "../../../_modules/client-vpn"

  name                    = var.vpn_name
  vpc_id                  = module.vpc_vpn.vpc_id
  client_cidr             = var.client_cidr_block
  organization_name       = var.organization_name
  logging_enabled         = var.logging_enabled
  logging_stream_name     = var.logging_stream_name
  retention_in_days       = var.retention_in_days
  associated_subnets      = module.vpc_vpn.private_subnets
  authentication_type     = var.authentication_type
  saml_provider_arn       = var.saml_provider_arn
  split_tunnel            = var.split_tunnel
  dns_servers             = var.dns_servers
  authorization_rules = [
    {
      name                 = "vpn-private1"
      description          = "vpn"
      access_group_id      = null
      authorize_all_groups = true
      target_network_cidr  = module.vpc_vpn.private_subnets_cidr_blocks[0]
    },
    {
      name                 = "vpn-private2"
      description          = "vpn"
      access_group_id      = null
      authorize_all_groups = true
      target_network_cidr  = module.vpc_vpn.private_subnets_cidr_blocks[1]
    },
    {
      name                 = "vpn-private3"
      description          = "vpn"
      access_group_id      = null
      authorize_all_groups = true
      target_network_cidr  = module.vpc_vpn.private_subnets_cidr_blocks[2]
    }
  ]

  additional_routes = [
    {
      destination_cidr_block = "10.10.0.0/16"
      description            = "Development"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 0)
    },
    {
      destination_cidr_block = "10.10.0.0/16"
      description            = "Development"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 1)
    },
    {
      destination_cidr_block = "10.10.0.0/16"
      description            = "Development"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 2)
    },
    {
      destination_cidr_block = "10.20.0.0/16"
      description            = "Staging"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 0)
    },
    {
      destination_cidr_block = "10.20.0.0/16"
      description            = "Staging"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 1)
    },
    {
      destination_cidr_block = "10.20.0.0/16"
      description            = "Staging"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 2)
    },
    {
      destination_cidr_block = "10.30.0.0/16"
      description            = "Production"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 0)
    },
    {
      destination_cidr_block = "10.30.0.0/16"
      description            = "Production"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 1)
    },
    {
      destination_cidr_block = "10.30.0.0/16"
      description            = "Production"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 2)
    },
     {
      destination_cidr_block = "10.0.0.0/16"
      description            = "Shared"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 0)
    },
    {
      destination_cidr_block = "10.0.0.0/16"
      description            = "Shared"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 1)
    },
    {
      destination_cidr_block = "10.0.0.0/16"
      description            = "Shared"
      target_vpc_subnet_id   = element(module.vpc_vpn.private_subnets, 2)
    }
  ]
}

