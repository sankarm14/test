output "nlb_name" {
  description = "The ARN suffix of the NLB"
  value       = module.nlb.nlb_name
}

output "nlb_arn" {
  description = "The ARN of the NLB"
  value       = module.nlb.nlb_arn
}

output "nlb_arn_suffix" {
  description = "The ARN suffix of the NLB"
  value       = module.nlb.nlb_arn_suffix
}

output "nlb_dns_name" {
  description = "DNS name of NLB"
  value       = module.nlb.nlb_dns_name
}

output "nlb_zone_id" {
  description = "The ID of the zone which NLB is provisioned"
  value       = module.nlb.nlb_zone_id
}

output "default_target_group_arn" {
  description = "The default target group ARN"
  value       = module.nlb.default_target_group_arn
}

output "default_target_group_arns" {
  description = "The default target group ARN"
  value       = module.nlb.default_target_group_arns
}

output "access_logs_bucket_id" {
  description = "The S3 bucket ID for access logs"
  value       = module.nlb.access_logs_bucket_id
}