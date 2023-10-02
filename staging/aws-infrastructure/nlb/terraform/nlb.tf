module "nlb" {
  source                            = "../../../../_modules/nlb"

  vpc_id                            = data.terraform_remote_state.staging.outputs.vpc_id
#  security_group_ids                = [module.sg.id]
  subnet_ids                        = data.terraform_remote_state.staging.outputs.public_subnets
  #allocation_ids                    = var.allocation_ids
  internal                          = var.internal
  tcp_enabled                       = var.tcp_enabled
  tcp_ports_nlb                     = var.tcp_ports_nlb
  tcp_ports_alb                     = var.tcp_ports_alb
  #tcp_ports_dev                     = var.tcp_ports_dev
  access_logs_enabled               = var.access_logs_enabled
  cross_zone_load_balancing_enabled = var.cross_zone_load_balancing_enabled
  idle_timeout                      = var.idle_timeout
  ip_address_type                   = var.ip_address_type
  deletion_protection_enabled       = var.deletion_protection_enabled
  deregistration_delay              = var.deregistration_delay
  health_check_ports_nlb            = var.health_check_ports_nlb
  health_check_ports_alb            = var.health_check_ports_alb
  health_check_timeout              = var.health_check_timeout
  health_check_healthy_threshold    = var.health_check_healthy_threshold
  health_check_unhealthy_threshold  = var.health_check_unhealthy_threshold
  health_check_interval             = var.health_check_interval
  target_group_ports_nlb            = var.target_group_ports_nlb
  target_group_ports_alb            = var.target_group_ports_alb
  target_group_target_type          = var.target_group_target_type
  target_group_target_type_alb      = var.target_group_target_type_alb
  #certificate_arn                   = data.aws_acm_certificate.issued.arn
  
  nlb_access_logs_s3_bucket_force_destroy         = var.nlb_access_logs_s3_bucket_force_destroy
  nlb_access_logs_s3_bucket_force_destroy_enabled = var.nlb_access_logs_s3_bucket_force_destroy_enabled

   tags = {
    backup-1d7r              = "enabled"
  }

  context = module.this.context
}


