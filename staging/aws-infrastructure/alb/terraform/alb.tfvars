# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
namespace                                       = "valor"
stage                                           = "staging"
name                                            = "alb"

# ---------------------------------------------------------------------------------------------------------------------
#   ALB
# ---------------------------------------------------------------------------------------------------------------------
internal                                        = false
#http_enabled                                    = true
#http_port                                       = 80
#http_redirect                                   = true
https_enabled                                   = true
https_ports                                     = [443, 4430]
access_logs_enabled                             = false
alb_access_logs_s3_bucket_force_destroy         = true
alb_access_logs_s3_bucket_force_destroy_enabled = true
cross_zone_load_balancing_enabled               = true
http2_enabled                                   = true
idle_timeout                                    = 60
ip_address_type                                 = "ipv4"
deletion_protection_enabled                     = false
health_check_ports                              = [443, 4430] 
health_check_path                               = "/"
health_check_timeout                            = 10
health_check_healthy_threshold                  = 2
health_check_unhealthy_threshold                = 2
health_check_interval                           = 15
health_check_matcher                            = "200-399"

# ---------------------------------------------------------------------------------------------------------------------
# LB-TG: Default
# ---------------------------------------------------------------------------------------------------------------------
# default_target_group_enabled = false
target_group_ports       = [443,4430]
target_group_protocol    = "HTTPS"
target_group_target_type = "instance"
deregistration_delay     = 15
stickiness = {
  cookie_duration = 60
  enabled         = true
}
# ---------------------------------------------------------------------------------------------------------------------
# Route53
# ---------------------------------------------------------------------------------------------------------------------
#allow_overwrite = true
#default_ttl     = 300
#default_type    = "A"
