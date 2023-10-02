# ---------------------------------------------------------------------------------------------------------------------
#   Env. Info
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
    description = "The name of the selected region."
    type        = string
    default = "us-east-1"
}

variable "security_group_name" {
    description = "Security Group Name that you will create"
    type        = string
}

variable "prevent_destroy" {
  type    = bool
  default = false
}

# ---------------------------------------------------------------------------------------------------------------------
#   Autoscale Group
# ---------------------------------------------------------------------------------------------------------------------
variable "instance_type" {
  type        = string
  description = "Instance type to launch"
}

variable "health_check_type" {
  type        = string
  description = "Controls how health checking is done. Valid values are `EC2` or `ELB`"
}

variable "wait_for_capacity_timeout" {
  type        = string
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior"
}

variable "max_size" {
  type        = number
  description = "The maximum size of the autoscale group"
}

variable "min_size" {
  type        = number
  description = "The minimum size of the autoscale group"
}

variable "cpu_utilization_high_threshold_percent" {
  type        = number
  description = "CPU utilization high threshold"
}

variable "cpu_utilization_low_threshold_percent" {
  type        = number
  description = "CPU utilization low threshold"
}

variable "ec2_autoscale_key_name" {
  type        = string
  description = "The SSH key name that should be used for the instance"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_iam_instance_profile_name" {
    description = "Iam Instance profile name"
    type        = string
}


