module "jenkins_kms_key" {
  source  = "../../../../_modules/kms_key"
  
  namespace               = var.key_namespace
  stage                   = var.key_stage
  name                    = var.key_name
  description             = var.key_description
  deletion_window_in_days = var.key_deletion_window_in_days
  enable_key_rotation     = var.key_enable_key_rotation
  alias                   = var.key_alias
  key_usage               = var.key_key_usage
}