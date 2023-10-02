module "route53" {
    
  source = "../../../../_modules/route53"

  zone_id       = data.terraform_remote_state.shared.outputs.zone_id

  records = [
    {
      name    = "jenkins"
      type    = "A"
      records = [module.jenkins[0].private_ip]
    },
  ]

}