output "efsserver_instances_ids" {
  description = "The ID of the instance"
  value = "${module.efsserver[*].id}"
}

output "efsserver_private_ip" {
  description = "The private IP address assigned to the instance."
  value       = "${module.efsserver[*].private_ip}"
}

output "key_arn" {
  value       = module.efsserver_kms_key.key_arn
  description = "Key ARN"
}

output "key_id" {
  value       = module.efsserver_kms_key.key_id
  description = "Key ID"
}

output "alias_arn" {
  value       = module.efsserver_kms_key.alias_arn
  description = "Alias ARN"
}

output "alias_name" {
  value       = module.efsserver_kms_key.alias_name
  description = "Alias name"
}

output "efs_server_sg_id" {
  value       = module.efsserver_sg.id
  description = "sg id"
}
