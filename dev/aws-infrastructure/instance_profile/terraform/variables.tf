# ---------------------------------------------------------------------------------------------------------------------
#   Env. Info
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
    description = "The name of the selected region."
    type        = string
    default = "us-east-1"
}
# ---------------------------------------------------------------------------------------------------------------------
#   SSM
# ---------------------------------------------------------------------------------------------------------------------
variable "ssm_instance_role_name" {
    description = "ssm instance role name"
    type        = string
}

variable "ssm_instance_profile_name" {
    description = "ssm instance profile name"
    type        = string
}