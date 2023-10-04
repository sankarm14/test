# ---------------------------------------------------------------------------------------------------------------------
#   Env. Info
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
  description = "The name of the selected region."
  type        = string
  default     = "us-east-1"
}

variable "security_group_name" {
  description = "Security Group Name that you will create"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
#   Autoscale Group
# ---------------------------------------------------------------------------------------------------------------------
variable "instance_type" {
  type        = string
  description = "Instance type to launch"
}

variable "health_check_type" {
  type        = string
  description = "Controls how health checking is done. Valid values are `EC2` or `ELB`"
}

variable "wait_for_capacity_timeout" {
  type        = string
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior"
}

variable "max_size" {
  type        = number
  description = "The maximum size of the autoscale group"
}

variable "min_size" {
  type        = number
  description = "The minimum size of the autoscale group"
}

variable "cpu_utilization_high_threshold_percent" {
  type        = number
  description = "CPU utilization high threshold"
}

variable "cpu_utilization_low_threshold_percent" {
  type        = number
  description = "CPU utilization low threshold"
}

variable "ec2_autoscale_key_name" {
  type        = string
  description = "The SSH key name that should be used for the instance"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_iam_instance_profile_name" {
  description = "Iam Instance profile name"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
#   ALB
# ---------------------------------------------------------------------------------------------------------------------
#variable "internal" {
#  type        = bool
#  description = "A boolean flag to determine whether the ALB should be internal"
#}
#variable "http_enabled" {
#  type        = bool
#  description = "A boolean flag to enable/disable HTTP listener"
#}
#
#variable "http_port" {
#  type        = number
#  description = "The port for the HTTP listener"
#}
#variable "http_redirect" {
#  type        = bool
#  description = "TheA boolean flag to determine the HTTP listner redirect to the HTTPS"
#}
#variable "https_enabled" {
#  type        = bool
#  description = "A boolean flag to enable/disable HTTP listener"
#}
#
#variable "https_port" {
#  type        = number
#  description = "The port for the HTTPS listener"
#}
#
#variable "access_logs_enabled" {
#  type        = bool
#  description = "A boolean flag to enable/disable access_logs"
#}
#
#variable "cross_zone_load_balancing_enabled" {
#  type        = bool
#  description = "A boolean flag to enable/disable cross zone load balancing"
#}
#
#variable "http2_enabled" {
#  type        = bool
#  description = "A boolean flag to enable/disable HTTP/2"
#}
#
#variable "idle_timeout" {
#  type        = number
#  description = "The time in seconds that the connection is allowed to be idle"
#}
#
#variable "ip_address_type" {
#  type        = string
#  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`."
#}
#
#variable "deletion_protection_enabled" {
#  type        = bool
#  description = "A boolean flag to enable/disable deletion protection for ALB"
#}
#
#variable "deregistration_delay" {
#  type        = number
#  description = "The amount of time to wait in seconds before changing the state of a deregistering target to unused"
#}
#
#variable "health_check_path" {
#  type        = string
#  description = "The destination for the health check request"
#}
#
#variable "health_check_timeout" {
#  type        = number
#  description = "The amount of time to wait in seconds before failing a health check request"
#}
#
#variable "health_check_healthy_threshold" {
#  type        = number
#  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
#}
#
#variable "health_check_unhealthy_threshold" {
#  type        = number
#  description = "The number of consecutive health check failures required before considering the target unhealthy"
#}
#
#variable "health_check_interval" {
#  type        = number
#  description = "The duration in seconds in between health checks"
#}
#
#variable "health_check_matcher" {
#  type        = string
#  description = "The HTTP response codes to indicate a healthy check"
#}
#
#variable "alb_access_logs_s3_bucket_force_destroy" {
#  type        = bool
#  description = "A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error"
#}
#
#variable "alb_access_logs_s3_bucket_force_destroy_enabled" {
#  type        = bool
#  description = <<-EOT
#    When `true`, permits `force_destroy` to be set to `true`.
#    This is an extra safety precaution to reduce the chance that Terraform will destroy and recreate
#    your S3 bucket, causing COMPLETE LOSS OF ALL DATA even if it was stored in Glacier.
#    WARNING: Upgrading this module from a version prior to 0.27.0 to this version
#      will cause Terraform to delete your existing S3 bucket CAUSING COMPLETE DATA LOSS
#      unless you follow the upgrade instructions on the Wiki [here](https://github.com/cloudposse/terraform-aws-s3-log-storage/wiki/Upgrading-to-v0.27.0-(POTENTIAL-DATA-LOSS)).
#      See additional instructions for upgrading from v0.27.0 to v0.28.0 [here](https://github.com/cloudposse/terraform-aws-s3-log-storage/wiki/Upgrading-to-v0.28.0-and-AWS-provider-v4-(POTENTIAL-DATA-LOSS)).
#    EOT
#}
#
#variable "target_group_port" {
#  type        = number
#  description = "The port for the default target group"
#}
#variable "target_group_protocol" {
#  type        = string
#  description = "The protocol for the default target group"
#}
#
#variable "target_group_target_type" {
#  type        = string
#  description = "The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group"
#}
#
#variable "stickiness" {
#  type = object({
#    cookie_duration = number
#    enabled         = bool
#  })
#  description = "Target group sticky configuration"
#}
## ---------------------------------------------------------------------------------------------------------------------
## Route53
## ---------------------------------------------------------------------------------------------------------------------
#variable "allow_overwrite" {
#  type        = bool
#  description = "allow_overwrite value valid for all record sets"
#  default     = false
#}
#variable "default_ttl" {
#  type        = number
#  description = "The TTL of the record(Required for non-alias records)"
#}
#variable "default_type" {
#  type        = string
#  description = "A | CNAME the most used"
#}
#