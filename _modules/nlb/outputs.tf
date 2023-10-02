output "nlb_name" {
  description = "The ARN suffix of the NLB"
  value       = join("", aws_lb.default.*.name)
}

output "nlb_arn" {
  description = "The ARN of the NLB"
  value       = join("", aws_lb.default.*.arn)
}

output "nlb_arn_suffix" {
  description = "The ARN suffix of the NLB"
  value       = join("", aws_lb.default.*.arn_suffix)
}

output "nlb_dns_name" {
  description = "DNS name of NLB"
  value       = join("", aws_lb.default.*.dns_name)
}

output "nlb_zone_id" {
  description = "The ID of the zone which NLB is provisioned"
  value       = join("", aws_lb.default.*.zone_id)
}

output "default_target_group_arn" {
  description = "The default target group ARN"
  value = flatten([
    for nlb in aws_lb_target_group.defaults_nlb : [
      for tg in nlb.*.arn : tg
    ]
  ])
}

output "default_target_group_arns" {
  description = "The default target group ARN list"
  value       = concat(
    [aws_lb_target_group.defaults_alb[0].*.arn],
    [aws_lb_target_group.defaults_alb[1].*.arn]
  )
}

#output "default_target_group_arns" {
#  description = "The default target group ARN list"
#  value = flatten([
#    for nlb in aws_lb_target_group.defaults_alb : [
#      for tg in nlb.*.arn : tg
#    ]
#  ])
#}

output "default_target_group_arn_suffix" {
  description = "The default target group ARN suffix"
  value       = join("", aws_lb_target_group.defaults_nlb.*.arn_suffix)
}

output "default_target_group_arn_suffixs" {
  description = "The default target group ARN suffix"
  value       = join("", aws_lb_target_group.defaults_alb.*.arn_suffix)
}


#output "default_listener_arn" {
#  description = "The ARN of the default listener"
#  value       = join("", aws_lb_listener.tcp_forward1.*.arn)
#}


#output "http_listener_arn" {
#  description = "The ARN of the HTTP forwarding listener"
#  value       = join("", aws_nlb_listener.http_forward.*.arn)
#}

#output "tcp_listener_arn" {
#  description = "The ARN of the TCP forwarding listener"
#  value       = join("", aws_lb_listener.tcp_forward1.*.arn)
#}

#output "http_redirect_listener_arn" {
#  description = "The ARN of the HTTP to HTTPS redirect listener"
#  value       = join("", aws_nlb_listener.http_redirect.*.arn)
#}

#output "https_listener_arn" {
#  description = "The ARN of the HTTPS listener"
#  value       = join("", aws_nlb_listener.https.*.arn)
#}

#output "listener_arns" {
#  description = "A list of all the listener ARNs"
#  value = concat(
#    [aws_lb_listener.tcp_forward1[0].*.arn], 
#    [aws_lb_listener.tcp_forward2[0].*.arn],
#    [aws_lb_listener.tcp_forward3[1].*.arn]
#  )
#}

output "access_logs_bucket_id" {
  description = "The S3 bucket ID for access logs"
  value       = module.access_logs.bucket_id
}
