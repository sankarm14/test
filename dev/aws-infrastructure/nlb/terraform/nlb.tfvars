# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
namespace                                       = "valor"
stage                                           = "dev"
name                                            = "nlb"
# ---------------------------------------------------------------------------------------------------------------------
#   NLB. info
# ---------------------------------------------------------------------------------------------------------------------

internal                                        = false
access_logs_enabled                             = true
nlb_access_logs_s3_bucket_force_destroy         = true
nlb_access_logs_s3_bucket_force_destroy_enabled = true
cross_zone_load_balancing_enabled               = true
idle_timeout                                    = 60
ip_address_type                                 = "ipv4"
deletion_protection_enabled                     = false
deregistration_delay                            = 15
tcp_ports_nlb                                   = [7890, 7891, 5890]
tcp_ports_alb                                   = [443, 4430]
tcp_ports_dev                                   = [8881, 8882, 8883, 8884, 8885, 8886, 8887,8888, 8889]
health_check_enabled                            = true
health_check_ports_nlb                          = [7890, 7891]
health_check_ports_alb                          = [443, 4430]
health_check_timeout                            = 10
health_check_healthy_threshold                  = 2
health_check_unhealthy_threshold                = 2
health_check_interval                           = 15
health_check_matcher                            = "200-399"
target_group_ports_nlb                          = [7890, 7891]
target_group_ports_alb                          = [443, 4430]
target_group_target_type                        = "instance"
allocation_ids                                  = ["eipalloc-082c40e6b074647ac", "eipalloc-04b6f384faf249b15"]