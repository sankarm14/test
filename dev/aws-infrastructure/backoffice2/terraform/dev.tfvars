
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region              = "us-east-1"
security_group_name = "valor-dev-bo2-sg"

# These variable values below override the /_modules/alb/variables.tf file
# ---------------------------------------------------------------------------------------------------------------------
#   Autoscale Group
# ---------------------------------------------------------------------------------------------------------------------
namespace                              = "valor"
stage                                  = "dev"
name                                   = "bo2"
instance_type                          = "t3.large"
health_check_type                      = "EC2"
wait_for_capacity_timeout              = "5m"
max_size                               = 5
min_size                               = 2
cpu_utilization_high_threshold_percent = 80
cpu_utilization_low_threshold_percent  = 20
ec2_autoscale_key_name                 = "dev-environment-instances-us-east-1"

# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name = "ValorInstanceProfileSSM"

# ---------------------------------------------------------------------------------------------------------------------
#   ALB
# ---------------------------------------------------------------------------------------------------------------------
#internal                                        = false
#http_enabled                                    = true
#http_port                                       = 80
#http_redirect                                   = true
#https_enabled                                   = true
#https_port                                      = 4430
#access_logs_enabled                             = true
#alb_access_logs_s3_bucket_force_destroy         = true
#alb_access_logs_s3_bucket_force_destroy_enabled = true
#cross_zone_load_balancing_enabled               = true
#http2_enabled                                   = true
#idle_timeout                                    = 60
#ip_address_type                                 = "ipv4"
#deletion_protection_enabled                     = false
#health_check_path                               = "/"
#health_check_timeout                            = 10
#health_check_healthy_threshold                  = 2
#health_check_unhealthy_threshold                = 2
#health_check_interval                           = 15
#health_check_matcher                            = "200-399"
#
## ---------------------------------------------------------------------------------------------------------------------
## LB-TG: Default
## ---------------------------------------------------------------------------------------------------------------------
#target_group_port        = 4430
#target_group_protocol    = "HTTPS"
#target_group_target_type = "instance"
#deregistration_delay     = 15
#stickiness = {
#  cookie_duration = 60
#  enabled         = true
#}
## ---------------------------------------------------------------------------------------------------------------------
## Route53
## ---------------------------------------------------------------------------------------------------------------------
#allow_overwrite = true
#default_ttl     = 300
#default_type    = "A"
#