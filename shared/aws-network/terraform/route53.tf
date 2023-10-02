module "route53" {
    
  source = "../../../_modules/route53"

  name = "shared.valoraws.com"

  vpc_ids = [
    module.vpc.vpc_id,
    data.terraform_remote_state.vpn.outputs.vpc_vpn_id
  ]

  providers = {
    aws = aws.network
  }
}

# ---------------------------------------------------------------------------------------------------------------------
#   Dev Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "dev" {
  vpc_id  = data.terraform_remote_state.dev.outputs.vpc_id
  zone_id = try(module.route53.zone["shared.valoraws.com"].zone_id, null)

  provider = "aws.network"
}

resource "aws_route53_zone_association" "dev" {
  vpc_id  = aws_route53_vpc_association_authorization.dev.vpc_id
  zone_id = aws_route53_vpc_association_authorization.dev.zone_id

  provider = "aws.dev"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Staging Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "staging" {
  vpc_id  = data.terraform_remote_state.staging.outputs.vpc_id
  zone_id = try(module.route53.zone["shared.valoraws.com"].zone_id, null)

  provider = "aws.network"
}

resource "aws_route53_zone_association" "staging" {
  vpc_id  = aws_route53_vpc_association_authorization.staging.vpc_id
  zone_id = aws_route53_vpc_association_authorization.staging.zone_id

  provider = "aws.staging"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Prod Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "prod" {
  vpc_id  = data.terraform_remote_state.prod.outputs.vpc_id
  zone_id = try(module.route53.zone["shared.valoraws.com"].zone_id, null)

  provider = "aws.network"
}

resource "aws_route53_zone_association" "prod" {
  vpc_id  = aws_route53_vpc_association_authorization.prod.vpc_id
  zone_id = aws_route53_vpc_association_authorization.prod.zone_id

  provider = "aws.prod"
}