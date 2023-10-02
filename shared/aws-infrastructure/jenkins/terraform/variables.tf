# ---------------------------------------------------------------------------------------------------------------------
#   Region
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
    description = "The name of the selected region."
    default = "us-east-1"
    type        = string
}
variable "env_name" {
    description = "Environment Name"
    type        = string
}
variable "vpc_name" {
    description = "VPC Name"
    type        = string
}
variable "subnet_name" {
    description = "Subnet Name that the servers will use"
    type        = string
}
variable "security_group_name" {
    description = "Security Group Name that you will create"
    type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
#   KMS Key
# ---------------------------------------------------------------------------------------------------------------------

variable "key_namespace" {
    description = "ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique"
    type        = string
}
variable "key_stage" {
    description = "ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release'"
    type        = string
}
variable "key_name" {
    description = "ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.This is the only ID element not also included as a tag. The name tag is set to the full id string. There is no tag with the value of the name input."
    type        = string
}
variable "key_description" {
    description = "The description of the key as viewed in AWS console"
    type        = string
}
variable "key_deletion_window_in_days" {
    description = "Duration in days after which the key is deleted after destruction of the resource"
    type        = number
}
variable "key_enable_key_rotation" {
    description = "Specifies whether key rotation is enabled"
    type        = bool
}
variable "key_alias" {
    description = "The display name of the alias. The name must start with the word alias followed by a forward slash. If not specified, the alias name will be auto-generated."
    type        = string
}
variable "key_key_usage" {
    description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY."
    type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
#   jenkins
# ---------------------------------------------------------------------------------------------------------------------

variable "jenkins_count" {
    description = "Sets the number of the instances."
    type        = number
}
variable "jenkins_name" {
    description = "Name to be used on EC2 instance created"
    type        = string
}
variable "jenkins_instance_type" {
    description = "The type of instance to start"
    type        = string
}
variable "jenkins_key_pair" {
    description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
    type        = string
}
variable "jenkins_root_volume_size" {
    description = "Size of the volume in gibibytes (GiB)."
    type        = number
}
variable "jenkins_private_ips" {
  description = "jenkins private ips"
  type        = map(string)
}

# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_iam_instance_profile_name" {
    description = "Iam Instance profile name"
    type        = string
}