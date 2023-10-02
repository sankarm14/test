# Boolean to determine if name will be appended with random string
variable "random_suffix" {
  description = "Set to true to append random suffix"
  type        = bool
  default     = true
}

# Length of random string to be appended to the name
variable "random_string_length" {
  description = "Random string length"
  type        = number
  default     = 3
}

# SSM IAM Role name
variable "ssm_instance_role_name" {
  description = "SSM IAM role name"
  type        = string
  default     = "ssm-role"
}

# SSM IAM Instance Profile name
variable "ssm_instance_profile_name" {
  description = "SSM instance profile name"
  type        = string
  default     = "ssm-instance-profile"
}

variable "partition" {
  description = "AWS type"
  type        = string
  default     = "global"

  validation {
    condition     = contains(["global", "china"], lower(var.partition))
    error_message = "Invalid partition. Choose global or china."
  }
}

variable "partition_map" {
  description = "ARN prefix"
  type        = map(any)

  default = {
    global = "aws"
    china  = "aws-cn"
  }
}

variable "domain_suffix_map" {
  description = "domain suffix"
  type        = map(any)

  default = {
    global = "com"
    china  = "com.cn"
  }
}

locals {
  partition     = lookup(var.partition_map, lower(var.partition), "global")
  domain_prefix = lookup(var.domain_suffix_map, lower(var.partition), "global")
}