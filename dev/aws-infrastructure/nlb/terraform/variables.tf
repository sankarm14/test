variable "region" {
    description = "The name of the selected region."
    type        = string
}

variable "internal" {
  type        = bool
  description = "A boolean flag to determine whether the NLB should be internal"
}

variable "access_logs_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable access_logs"
}

variable "cross_zone_load_balancing_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable cross zone load balancing"
}

variable "idle_timeout" {
  type        = number
  description = "The time in seconds that the connection is allowed to be idle"
}

variable "ip_address_type" {
  type        = string
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`."
}

variable "deletion_protection_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable deletion protection for NLB"
}

variable "deregistration_delay" {
  type        = number
  description = "The amount of time to wait in seconds before changing the state of a deregistering target to unused"
}

variable "health_check_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable the NLB health checks"
}

variable "health_check_ports_nlb" {
  type        = list(string)
  description = "The health check port"
}

variable "health_check_ports_alb" {
  type        = list(string)
  description = "The port to use for the healthcheck"
}

variable "health_check_timeout" {
  type        = number
  description = "The amount of time to wait in seconds before failing a health check request"
}

variable "health_check_healthy_threshold" {
  type        = number
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}

variable "health_check_unhealthy_threshold" {
  type        = number
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}

variable "health_check_interval" {
  type        = number
  description = "The duration in seconds in between health checks"
}

variable "health_check_matcher" {
  type        = string
  description = "The TCP response codes to indicate a healthy check"
}

variable "nlb_access_logs_s3_bucket_force_destroy" {
  type        = bool
  description = "A boolean that indicates all objects should be deleted from the NLB access logs S3 bucket so that the bucket can be destroyed without error"
}

variable "nlb_access_logs_s3_bucket_force_destroy_enabled" {
  type        = bool
  description = <<-EOT
    When `true`, permits `force_destroy` to be set to `true`.
    This is an extra safety precaution to reduce the chance that Terraform will destroy and recreate
    your S3 bucket, causing COMPLETE LOSS OF ALL DATA even if it was stored in Glacier.
    WARNING: Upgrading this module from a version prior to 0.27.0 to this version
      will cause Terraform to delete your existing S3 bucket CAUSING COMPLETE DATA LOSS
      unless you follow the upgrade instructions on the Wiki [here](https://github.com/cloudposse/terraform-aws-s3-log-storage/wiki/Upgrading-to-v0.27.0-(POTENTIAL-DATA-LOSS)).
      See additional instructions for upgrading from v0.27.0 to v0.28.0 [here](https://github.com/cloudposse/terraform-aws-s3-log-storage/wiki/Upgrading-to-v0.28.0-and-AWS-provider-v4-(POTENTIAL-DATA-LOSS)).
    EOT
}

variable "tcp_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable TCP listener"
}

variable "tcp_ports_nlb" {
  type        = list(number)
  description = "The port for the TCP listener"
}

variable "tcp_ports_alb" {
  type        = list(number)
  description = "The port for the TCP listener"
}
variable "tcp_ports_dev" {
  type        = list(number)
  description = "The port for the TCP listener"
}
#variable "tcp_port_range" {
#  type        = list(number)
#  default     = [8881, 8889]
#  description = "The range of ports for the TCP listener"
#}
#
#variable "tcp_ports_dev" {
#  type        = list(number)
#  default     = [for port in range(var.tcp_port_range[0], var.tcp_port_range[1] + 1): port]
#  description = "The ports for the TCP listener"
#}

variable "target_group_ports_nlb" {
  type        = list(number)
  description = "The port for the default target group"
}

variable "target_group_ports_alb" {
  type        = list(number)
  description = "The port for the default target group"
}
variable "target_group_target_type" {
  type        = string
  description = "The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "target_group_target_type_alb" {
  type        = string
  default     = "alb"
  description = "The type (`instance`, `ip` or `lambda`, 'alb') of targets that can be registered with the target group"
}

variable "load_balancer_name" {
  type        = string
  default     = "dev-nlb"
  description = "the name for the default load balancer, use a module label if left empty" 
}

variable "allocation_ids" {
  type        = list(string)
  description = "A list of subnet IDs to associate with NLB"
}
