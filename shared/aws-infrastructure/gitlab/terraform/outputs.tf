output "gitlab_instances_ids" {
  description = "The ID of the instance"
  value = "${module.gitlab[*].id}"
}

output "gitlab_private_ip" {
  description = "The private IP address assigned to the instance."
  value       = "${module.gitlab[*].private_ip}"
}

output "key_arn" {
  value       = module.gitlab_kms_key.key_arn
  description = "Key ARN"
}

output "key_id" {
  value       = module.gitlab_kms_key.key_id
  description = "Key ID"
}

output "alias_arn" {
  value       = module.gitlab_kms_key.alias_arn
  description = "Alias ARN"
}

output "alias_name" {
  value       = module.gitlab_kms_key.alias_name
  description = "Alias name"
}