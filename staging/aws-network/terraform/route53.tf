module "route53" {
    
  source = "../../../_modules/route53"

  name = "staging.valoraws.com"

  vpc_ids = [
    module.vpc.vpc_id
  ]

  providers = {
    aws = aws.staging
  }
}

# ---------------------------------------------------------------------------------------------------------------------
#   Shared Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "shared" {
  vpc_id  = data.terraform_remote_state.shared.outputs.vpc_id
  zone_id = try(module.route53.zone["staging.valoraws.com"].zone_id, null)

  provider = aws.staging
}

resource "aws_route53_zone_association" "shared" {
  vpc_id  = aws_route53_vpc_association_authorization.shared.vpc_id
  zone_id = aws_route53_vpc_association_authorization.shared.zone_id

  provider = aws.shared
}

# ---------------------------------------------------------------------------------------------------------------------
#   VPN Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "vpn" {
  vpc_id  = data.terraform_remote_state.vpn.outputs.vpc_vpn_id
  zone_id = try(module.route53.zone["staging.valoraws.com"].zone_id, null)

  provider = aws.staging
}

resource "aws_route53_zone_association" "vpn" {
  vpc_id  = aws_route53_vpc_association_authorization.vpn.vpc_id
  zone_id = aws_route53_vpc_association_authorization.vpn.zone_id

  provider = aws.vpn
}

# ---------------------------------------------------------------------------------------------------------------------
#   Prod Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "prod" {
  vpc_id  = data.terraform_remote_state.prod.outputs.vpc_id
  zone_id = try(module.route53.zone["staging.valoraws.com"].zone_id, null)

  provider = aws.staging
}

resource "aws_route53_zone_association" "prod" {
  vpc_id  = aws_route53_vpc_association_authorization.prod.vpc_id
  zone_id = aws_route53_vpc_association_authorization.prod.zone_id

  provider = aws.prod
}

# ---------------------------------------------------------------------------------------------------------------------
#   Dev Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "dev" {
  vpc_id  = data.terraform_remote_state.dev.outputs.vpc_id
  zone_id = try(module.route53.zone["staging.valoraws.com"].zone_id, null)

  provider = aws.staging
}

resource "aws_route53_zone_association" "dev" {
  vpc_id  = aws_route53_vpc_association_authorization.dev.vpc_id
  zone_id = aws_route53_vpc_association_authorization.dev.zone_id

  provider = aws.dev
}