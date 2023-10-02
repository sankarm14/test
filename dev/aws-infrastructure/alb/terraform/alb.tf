# These variable values below override the ./dev.tfvars file
module "alb" {
  source = "../../../../_modules/alb"

  vpc_id                            = data.terraform_remote_state.dev.outputs.vpc_id
  #security_group_ids                = data.terraform_remote_state.bo1.outputs.security_group_id
  subnet_ids                        = data.terraform_remote_state.dev.outputs.public_subnets
  internal                          = var.internal
  #http_enabled                      = var.http_enabled
  #http_port                         = var.http_port
  #http_redirect                     = var.http_redirect
  https_enabled                     = var.https_enabled
  https_ports                       = var.https_ports
  access_logs_enabled               = var.access_logs_enabled
  cross_zone_load_balancing_enabled = var.cross_zone_load_balancing_enabled
  http2_enabled                     = var.http2_enabled
  idle_timeout                      = var.idle_timeout
  ip_address_type                   = var.ip_address_type
  deletion_protection_enabled       = var.deletion_protection_enabled
  deregistration_delay              = var.deregistration_delay
  health_check_ports                = var.health_check_ports 
  health_check_path                 = var.health_check_path
  health_check_timeout              = var.health_check_timeout
  health_check_healthy_threshold    = var.health_check_healthy_threshold
  health_check_unhealthy_threshold  = var.health_check_unhealthy_threshold
  health_check_interval             = var.health_check_interval
  health_check_matcher              = var.health_check_matcher
  target_group_ports                = var.target_group_ports
  target_group_protocol             = var.target_group_protocol
  target_group_target_type          = var.target_group_target_type
  stickiness                        = var.stickiness
  certificate_arn                   = data.aws_acm_certificate.issued.arn


  alb_access_logs_s3_bucket_force_destroy         = var.alb_access_logs_s3_bucket_force_destroy
  alb_access_logs_s3_bucket_force_destroy_enabled = var.alb_access_logs_s3_bucket_force_destroy_enabled

  context = module.this.context
}
