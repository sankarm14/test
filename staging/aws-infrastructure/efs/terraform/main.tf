module "efs" {
  source                            = "../../../../_modules/efs"
  
  security_group_name               = length(var.sg_name) > 0 ? [var.sg_name] : []
  region                            = var.region
  vpc_id                            = data.terraform_remote_state.staging.outputs.vpc_id
  subnets                           = data.terraform_remote_state.staging.outputs.private_subnets
  creation_token                    = var.creation_token
  availability_zone_name            = var.availability_zone_name
  encrypted                         = var.encrypted
  performance_mode                  = var.performance_mode
  provisioned_throughput_in_mibps   = var.provisioned_throughput_in_mibps
  throughput_mode                   = var.throughput_mode
  efs_backup_policy_enabled         = var.efs_backup_policy_enabled 


   tags = {
    backup-1d7r              = "enabled"
  }

  transition_to_ia = ["AFTER_7_DAYS"]

  security_group_create_before_destroy = var.security_group_create_before_destroy

  context = module.this.context
}