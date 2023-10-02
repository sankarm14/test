# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
namespace                                       = "valor"
stage                                           = "dev"
name                                            = "efs"
sg_name                                         = "valor-efs-sg"
# ---------------------------------------------------------------------------------------------------------------------
#   EFS. info
# ---------------------------------------------------------------------------------------------------------------------

availability_zone_name                          = "us-east-1a"
enabled                                         = true
encrypted                                       = true
performance_mode                                = "generalPurpose"
provisioned_throughput_in_mibps                 = 0
throughput_mode                                 = "bursting"
efs_backup_policy_enabled                       = false
security_group_create_before_destroy            = true
security_group_create_timeout                   = "10m"
security_group_delete_timeout                   = "15m"
