output "efs_arn" {
  description = "efs_arn"
  value = module.efs.arn
}

output "efs_id" {
  description = "efs_id"
  value = module.efs.id
}

output "efs_dns_name" {
  description = "efs_dns_name"
  value = module.efs.dns_name
}

output "efs_mount_target_ids" {
  description = "efs_mount_target_ids"
  value = module.efs.mount_target_ids
}