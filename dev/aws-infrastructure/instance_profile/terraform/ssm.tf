module "ssm_instance_profile" {
  source = "../../../../_modules/ssm-instance-profile"

  random_suffix = false
  ssm_instance_role_name = var.ssm_instance_role_name
  ssm_instance_profile_name = var.ssm_instance_profile_name
}
