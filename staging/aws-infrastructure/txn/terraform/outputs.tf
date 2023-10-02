# ---------------------------------------------------------------------------------------------------------------------
#   Autoscale Group
# ---------------------------------------------------------------------------------------------------------------------
output "launch_template_id" {
  description = "The ID of the launch template"
  value       = module.autoscale_group.launch_template_id
}

output "launch_template_arn" {
  description = "The ARN of the launch template"
  value       = module.autoscale_group.launch_template_arn
}

output "autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = module.autoscale_group.autoscaling_group_id
}

output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = module.autoscale_group.autoscaling_group_name
}

output "autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = module.autoscale_group.autoscaling_group_arn
}

output "autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = module.autoscale_group.autoscaling_group_min_size
}

output "autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       = module.autoscale_group.autoscaling_group_max_size
}

output "autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = module.autoscale_group.autoscaling_group_desired_capacity
}

output "autoscaling_group_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = module.autoscale_group.autoscaling_group_default_cooldown
}

output "autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = module.autoscale_group.autoscaling_group_health_check_grace_period
}

output "autoscaling_group_health_check_type" {
  description = "`EC2` or `ELB`. Controls how health checking is done"
  value       = module.autoscale_group.autoscaling_group_health_check_type
}

# ---------------------------------------------------------------------------------------------------------------------
#   NLB
# ---------------------------------------------------------------------------------------------------------------------

#output "nlb_name" {
#  description = "The ARN suffix of the NLB"
#  value       = module.nlb.nlb_name
#}
#
#output "nlb_arn" {
#  description = "The ARN of the NLB"
#  value       = module.nlb.nlb_arn
#}
#
#output "nlb_arn_suffix" {
#  description = "The ARN suffix of the NLB"
#  value       = module.nlb.nlb_arn_suffix
#}
#
#output "nlb_dns_name" {
#  description = "DNS name of NLB"
#  value       = module.nlb.nlb_dns_name
#}
#
#output "nlb_zone_id" {
#  description = "The ID of the zone which NLB is provisioned"
#  value       = module.nlb.nlb_zone_id
#}
#
#output "default_target_group_arn" {
#  description = "The default target group ARN"
#  value       = module.nlb.default_target_group_arn
#}
#
#output "access_logs_bucket_id" {
#  description = "The S3 bucket ID for access logs"
#  value       = module.nlb.access_logs_bucket_id
#}

# ---------------------------------------------------------------------------------------------------------------------
#   Security Group
# ---------------------------------------------------------------------------------------------------------------------
output "sg_id" {
  description = "The ID of the created Security Group"
  value       = module.sg.id
}
output "target_group_arn" {
  description = "The Arn of the target Group"
  value       = data.aws_lb_target_group_attachment.txn_nlb.arn
}