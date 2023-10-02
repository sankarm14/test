module "route53" {
  source = "../../../../_modules/route53"
  /**
  * If name not given skip_zone_creation will be true
  */
  zone_id         = data.terraform_remote_state.dev.outputs.zone_id
  allow_overwrite = var.allow_overwrite
  records = [
    {
      name = "nlb"
      type = var.default_type
      alias = {
        name                   = module.nlb.nlb_dns_name
        zone_id                = module.alb.alb_zone_id
        evaluate_target_health = true
      }
    }
  ]
}

