variable "region" {
  description = "AWS Region"
  type        = string
}

variable "creation_token" {
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation. By default generated by Terraform"
  type        = string
  default     = null
}

variable "availability_zone_name" {
  description = "AWS Availability Zone in which to create the file system. Used to create a file system that uses One Zone storage classes or standard storage class. If set, a single subnet in the same availability zone should be provided to `subnets`"
  type        = string
}

variable "encrypted" {
  type        = bool
  description = "If true, the file system will be encrypted"
}

variable "performance_mode" {
  type        = string
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`"
}

variable "provisioned_throughput_in_mibps" {
  type        = number
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with `throughput_mode` set to provisioned"
}

variable "throughput_mode" {
  type        = string
  description = "Throughput mode for the file system. Defaults to bursting. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`"
}

variable "mount_target_ip_address" {
  type        = string
  description = "The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target"
  default     = null
}

variable "efs_backup_policy_enabled" {
  type        = bool
  description = "If `true`, it will turn on automatic backups."
}

variable "sg_name" {
  type        = string
  default     = ""
  description = "Name to give to created security group"
}

variable "security_group_create_before_destroy" {
  type        = bool
  #default     = true
  description = <<-EOT
    Set `true` to enable Terraform `create_before_destroy` behavior on the created security group.
    Note that changing this value will always cause the security group to be replaced.
    EOT
}

variable "security_group_create_timeout" {
  type        = string
  description = "How long to wait for the security group to be created."
}

variable "security_group_delete_timeout" {
  type        = string
  description = <<-EOT
    How long to retry on `DependencyViolation` errors during security group deletion from
    lingering ENIs left by certain AWS services such as Elastic Load Balancing.
    EOT
}