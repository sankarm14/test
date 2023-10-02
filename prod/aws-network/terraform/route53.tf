module "route53" {
    
  source = "../../../_modules/route53"

  name = "prod.valoraws.com"

  vpc_ids = [
    module.vpc.vpc_id
  ]

  providers = {
    aws = aws.prod
  }
}

# ---------------------------------------------------------------------------------------------------------------------
#   Shared Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "shared" {
  vpc_id  = data.terraform_remote_state.shared.outputs.vpc_id
  zone_id = try(module.route53.zone["prod.valoraws.com"].zone_id, null)

  provider = aws.prod
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
  zone_id = try(module.route53.zone["prod.valoraws.com"].zone_id, null)

  provider = aws.prod
}

resource "aws_route53_zone_association" "vpn" {
  vpc_id  = aws_route53_vpc_association_authorization.vpn.vpc_id
  zone_id = aws_route53_vpc_association_authorization.vpn.zone_id

  provider = aws.vpn
}

# ---------------------------------------------------------------------------------------------------------------------
#   Staging Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "staging" {
  vpc_id  = data.terraform_remote_state.staging.outputs.vpc_id
  zone_id = try(module.route53.zone["prod.valoraws.com"].zone_id, null)

  provider = aws.prod
}

resource "aws_route53_zone_association" "staging" {
  vpc_id  = aws_route53_vpc_association_authorization.staging.vpc_id
  zone_id = aws_route53_vpc_association_authorization.staging.zone_id

  provider = aws.staging
}

# ---------------------------------------------------------------------------------------------------------------------
#   Dev Route53 VPC Association
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_vpc_association_authorization" "dev" {
  vpc_id  = data.terraform_remote_state.dev.outputs.vpc_id
  zone_id = try(module.route53.zone["prod.valoraws.com"].zone_id, null)

  provider = aws.prod
}

resource "aws_route53_zone_association" "dev" {
  vpc_id  = aws_route53_vpc_association_authorization.dev.vpc_id
  zone_id = aws_route53_vpc_association_authorization.dev.zone_id

  provider = aws.dev
}