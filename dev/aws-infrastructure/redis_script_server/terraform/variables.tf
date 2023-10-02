# ---------------------------------------------------------------------------------------------------------------------
#   Env. Info
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
    description = "The name of the selected region."
    type        = string
    default = "us-east-1"
}


# ---------------------------------------------------------------------------------------------------------------------
#   Redis
# ---------------------------------------------------------------------------------------------------------------------
variable "cluster_size" {
  type        = number
  description = "Number of nodes in cluster"
}

variable "instance_type" {
  type        = string
  description = "Elastic cache instance type"
}

variable "family" {
  type        = string
  description = "Redis family"
}

variable "engine_version" {
  type        = string
  description = "Redis engine version"
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "Enable encryption at rest"
}

variable "transit_encryption_enabled" {
  type        = bool
  description = "Enable TLS"
}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Flag to enable/disable creation of a native redis cluster. automatic_failover_enabled must be set to true. Only 1 cluster_mode block is allowed"
}

variable "cloudwatch_metric_alarms_enabled" {
  type        = bool
  description = "Boolean flag to enable/disable CloudWatch metrics alarms"
}

variable "sg_name" {
  type        = string
  default     = ""
  description = "Name to give to created security group"
}
