# Create the Transit Gateway, route table associations/propagations, and static TGW routes in the `network` account.
# Enable sharing the Transit Gateway with the Organization using Resource Access Manager (RAM).
# If you would like to share resources with your organization or organizational units,
# then you must use the AWS RAM console or CLI command to enable sharing with AWS Organizations.
# When you share resources within your organization,
# AWS RAM does not send invitations to principals. Principals in your organization get access to shared resources without exchanging invitations.
# https://docs.aws.amazon.com/ram/latest/userguide/getting-started-sharing.html

module "transit_gateway" {
  source = "../../../_modules/tgw"

  ram_resource_share_enabled                                        = true

  

  create_transit_gateway                                            = true
  create_transit_gateway_route_table                                = true
  create_transit_gateway_vpc_attachment                             = false
  create_transit_gateway_route_table_association_and_propagation    = true

  config = {
    prod = {
      vpc_id                            = null
      vpc_cidr                          = null
      subnet_ids                        = null
      subnet_route_table_ids            = null
      route_to                          = null
      route_to_cidr_blocks              = null
      transit_gateway_vpc_attachment_id = module.transit_gateway_vpc_attachments_and_subnet_routes_prod.transit_gateway_vpc_attachment_ids["prod"]
      static_routes                     = null
    },
    staging = {
      vpc_id                            = null
      vpc_cidr                          = null
      subnet_ids                        = null
      subnet_route_table_ids            = null
      route_to                          = null
      route_to_cidr_blocks              = null
      transit_gateway_vpc_attachment_id = module.transit_gateway_vpc_attachments_and_subnet_routes_staging.transit_gateway_vpc_attachment_ids["staging"]
      static_routes                     = null
    },
    dev = {
      vpc_id                            = null
      vpc_cidr                          = null
      subnet_ids                        = null
      subnet_route_table_ids            = null
      route_to                          = null
      route_to_cidr_blocks              = null
      static_routes                     = null
      transit_gateway_vpc_attachment_id = module.transit_gateway_vpc_attachments_and_subnet_routes_dev.transit_gateway_vpc_attachment_ids["dev"]
    },
    vpn = {
      vpc_id                            = null
      vpc_cidr                          = null
      subnet_ids                        = null
      subnet_route_table_ids            = null
      route_to                          = null
      route_to_cidr_blocks              = null
      static_routes                     = null
      transit_gateway_vpc_attachment_id = module.transit_gateway_vpc_attachments_and_subnet_routes_vpn.transit_gateway_vpc_attachment_ids["vpn"]
    },
    shared = {
      vpc_id                            = null
      vpc_cidr                          = null
      subnet_ids                        = null
      subnet_route_table_ids            = null
      route_to                          = null
      route_to_cidr_blocks              = null
      static_routes                     = null
      transit_gateway_vpc_attachment_id = module.transit_gateway_vpc_attachments_and_subnet_routes_shared.transit_gateway_vpc_attachment_ids["shared"]
    }
  }

  context = module.this.context

  providers = {
    aws = aws.network
  }
}


# Create the Transit Gateway VPC attachments and subnets routes in the `prod`, `staging` and `dev` accounts

module "transit_gateway_vpc_attachments_and_subnet_routes_prod" {
  source = "../../../_modules/tgw"

  # `prod` account can access the Transit Gateway in the `network` account since we shared the Transit Gateway with the Organization using Resource Access Manager
  existing_transit_gateway_id             = module.transit_gateway.transit_gateway_id
  existing_transit_gateway_route_table_id = module.transit_gateway.transit_gateway_route_table_id
  
  create_transit_gateway                                         = false
  create_transit_gateway_route_table                             = false
  create_transit_gateway_vpc_attachment                          = true
  create_transit_gateway_route_table_association_and_propagation = false

  config = {
    prod = {
      vpc_id                 = data.terraform_remote_state.prod.outputs.vpc_id
      vpc_cidr               = data.terraform_remote_state.prod.outputs.vpc_cidr_block
      subnet_ids             = data.terraform_remote_state.prod.outputs.intra_subnets
      subnet_route_table_ids = concat(data.terraform_remote_state.prod.outputs.intra_route_table_ids, data.terraform_remote_state.prod.outputs.private_route_table_ids)
      route_to               = null
      route_to_cidr_blocks = [
        data.terraform_remote_state.staging.outputs.vpc_cidr_block,
        data.terraform_remote_state.dev.outputs.vpc_cidr_block,
        data.terraform_remote_state.vpn.outputs.vpc_vpn_cidr_block,
        data.terraform_remote_state.shared.outputs.vpc_cidr_block
      ]
      static_routes                     = null
      transit_gateway_vpc_attachment_id = null
    }
  }

  context = module.this.context

  providers = {
    aws = aws.prod
  }
}

module "transit_gateway_vpc_attachments_and_subnet_routes_staging" {
  source = "../../../_modules/tgw"

  # `staging` account can access the Transit Gateway in the `network` account since we shared the Transit Gateway with the Organization using Resource Access Manager
  existing_transit_gateway_id             = module.transit_gateway.transit_gateway_id
  existing_transit_gateway_route_table_id = module.transit_gateway.transit_gateway_route_table_id

  create_transit_gateway                                         = false
  create_transit_gateway_route_table                             = false
  create_transit_gateway_vpc_attachment                          = true
  create_transit_gateway_route_table_association_and_propagation = false

  config = {
    staging = {
      vpc_id                 = data.terraform_remote_state.staging.outputs.vpc_id
      vpc_cidr               = data.terraform_remote_state.staging.outputs.vpc_cidr_block
      subnet_ids             = data.terraform_remote_state.staging.outputs.intra_subnets
      subnet_route_table_ids = concat(data.terraform_remote_state.staging.outputs.intra_route_table_ids, data.terraform_remote_state.staging.outputs.private_route_table_ids)
      route_to               = null
      route_to_cidr_blocks = [
        data.terraform_remote_state.prod.outputs.vpc_cidr_block,
        data.terraform_remote_state.dev.outputs.vpc_cidr_block,
        data.terraform_remote_state.vpn.outputs.vpc_vpn_cidr_block,
        data.terraform_remote_state.shared.outputs.vpc_cidr_block
      ]
      static_routes                     = null
      transit_gateway_vpc_attachment_id = null
    }
  }

  context = module.this.context

  providers = {
    aws = aws.staging
  }
}

module "transit_gateway_vpc_attachments_and_subnet_routes_dev" {
  source = "../../../_modules/tgw"

  # `dev` account can access the Transit Gateway in the `network` account since we shared the Transit Gateway with the Organization using Resource Access Manager
  existing_transit_gateway_id             = module.transit_gateway.transit_gateway_id
  existing_transit_gateway_route_table_id = module.transit_gateway.transit_gateway_route_table_id

  create_transit_gateway                                         = false
  create_transit_gateway_route_table                             = false
  create_transit_gateway_vpc_attachment                          = true
  create_transit_gateway_route_table_association_and_propagation = false

  config = {
    dev = {
      vpc_id                            = data.terraform_remote_state.dev.outputs.vpc_id
      vpc_cidr                          = data.terraform_remote_state.dev.outputs.vpc_cidr_block
      subnet_ids                        = data.terraform_remote_state.dev.outputs.intra_subnets
      subnet_route_table_ids            = concat(data.terraform_remote_state.dev.outputs.intra_route_table_ids, data.terraform_remote_state.dev.outputs.private_route_table_ids)
      route_to                          = null
      route_to_cidr_blocks              = [
        data.terraform_remote_state.prod.outputs.vpc_cidr_block,
        data.terraform_remote_state.staging.outputs.vpc_cidr_block,
        data.terraform_remote_state.vpn.outputs.vpc_vpn_cidr_block,
        data.terraform_remote_state.shared.outputs.vpc_cidr_block
      ]
      static_routes                     = null
      transit_gateway_vpc_attachment_id = null
    }
  }

  context = module.this.context

  providers = {
    aws = aws.dev
  }
}

module "transit_gateway_vpc_attachments_and_subnet_routes_vpn" {
  source = "../../../_modules/tgw"

  # `prod` account can access the Transit Gateway in the `network` account since we shared the Transit Gateway with the Organization using Resource Access Manager
  existing_transit_gateway_id             = module.transit_gateway.transit_gateway_id
  existing_transit_gateway_route_table_id = module.transit_gateway.transit_gateway_route_table_id
  
  create_transit_gateway                                         = false
  create_transit_gateway_route_table                             = false
  create_transit_gateway_vpc_attachment                          = true
  create_transit_gateway_route_table_association_and_propagation = false

  config = {
    vpn = {
      vpc_id                 = data.terraform_remote_state.vpn.outputs.vpc_vpn_id
      vpc_cidr               = data.terraform_remote_state.vpn.outputs.vpc_vpn_cidr_block
      subnet_ids             = data.terraform_remote_state.vpn.outputs.intra_subnets_vpn
      subnet_route_table_ids = concat(data.terraform_remote_state.vpn.outputs.intra_route_table_ids_vpn, data.terraform_remote_state.vpn.outputs.private_route_table_ids_vpn)
      route_to               = null
      route_to_cidr_blocks = [
        data.terraform_remote_state.prod.outputs.vpc_cidr_block,
        data.terraform_remote_state.staging.outputs.vpc_cidr_block,
        data.terraform_remote_state.dev.outputs.vpc_cidr_block,
        data.terraform_remote_state.shared.outputs.vpc_cidr_block
      ]
      static_routes                     = null
      transit_gateway_vpc_attachment_id = null
    }
  }

  context = module.this.context

  providers = {
    aws = aws.network
  }
}

module "transit_gateway_vpc_attachments_and_subnet_routes_shared" {
  source = "../../../_modules/tgw"

  # `prod` account can access the Transit Gateway in the `network` account since we shared the Transit Gateway with the Organization using Resource Access Manager
  existing_transit_gateway_id             = module.transit_gateway.transit_gateway_id
  existing_transit_gateway_route_table_id = module.transit_gateway.transit_gateway_route_table_id
  
  create_transit_gateway                                         = false
  create_transit_gateway_route_table                             = false
  create_transit_gateway_vpc_attachment                          = true
  create_transit_gateway_route_table_association_and_propagation = false

  config = {
    shared = {
      vpc_id                 = data.terraform_remote_state.shared.outputs.vpc_id
      vpc_cidr               = data.terraform_remote_state.shared.outputs.vpc_cidr_block
      subnet_ids             = data.terraform_remote_state.shared.outputs.intra_subnets
      subnet_route_table_ids = concat(data.terraform_remote_state.shared.outputs.intra_route_table_ids, data.terraform_remote_state.shared.outputs.private_route_table_ids)
      route_to               = null
      route_to_cidr_blocks = [
        data.terraform_remote_state.prod.outputs.vpc_cidr_block,
        data.terraform_remote_state.staging.outputs.vpc_cidr_block,
        data.terraform_remote_state.dev.outputs.vpc_cidr_block,
        data.terraform_remote_state.vpn.outputs.vpc_vpn_cidr_block
      ]
      static_routes                     = null
      transit_gateway_vpc_attachment_id = null
    }
  }

  context = module.this.context

  providers = {
    aws = aws.network
  }
}