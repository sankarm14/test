
# ---------------------------------------------------------------------------------------------------------------------
#   ALB
# ---------------------------------------------------------------------------------------------------------------------

output "alb_name" {
  description = "The ARN suffix of the ALB"
  value       = module.alb.alb_name
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = module.alb.alb_arn
}

output "alb_arn_suffix" {
  description = "The ARN suffix of the ALB"
  value       = module.alb.alb_arn_suffix
}

output "alb_dns_name" {
  description = "DNS name of ALB"
  value       = module.alb.alb_dns_name
}

output "alb_zone_id" {
  description = "The ID of the zone which ALB is provisioned"
  value       = module.alb.alb_zone_id
}

#output "security_group_id" {
#  description = "The security group ID of the ALB"
#  value       = module.alb.security_group_id
#}

output "default_target_group_arns" {
  description = "The default target group ARN"
  value       = module.alb.default_target_group_arns
}

#output "nlb_target_arn" {
#  value = aws_lb_target_group.nlb_tg.target_group_arns[0]
#}

#output "target_group_attachments" {
#  description = "ARNs of the target group attachment IDs"
#  value = join(",", [for attachment in aws_lb_target_group_attachment.default_attachment : attachment.id])
#}

#output "http_listener_arn" {
#  description = "The ARN of the HTTP listener"
#  value       = module.alb.http_listener_arn
#}

output "listener_arns" {
  description = "A list of all the listener ARNs"
  value       = module.alb.listener_arns
}

output "access_logs_bucket_id" {
  description = "The S3 bucket ID for access logs"
  value       = module.alb.access_logs_bucket_id
}

## ---------------------------------------------------------------------------------------------------------------------
## Route53
## ---------------------------------------------------------------------------------------------------------------------

#output "alias_value_name_type" {
#  value = {
#    name = module.route53.alias.value.name,
#    type = type(jsonencode(module.route53.alias.value.name))
#  }
#}
#
#output "alias_value_zone_id_type" {
#  value = {
#    zone_id = module.route53.alias.value.zone_id,
#    type = type(jsonencode(module.route53.alias.value.zone_id))
#  }
#}
