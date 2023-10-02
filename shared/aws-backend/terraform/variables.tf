# --------------------------------------------------------- 
# tf-backend variables
# ---------------------------------------------------------
variable "tfstateBucketName" {
  description = "The name of the s3 bucket that holds terraform state file"
  type        = string
}

variable "tfstateTableName" {
  description = "The name of the dynamodb table that locks the terraform state file"
  type        = string
}

variable "environment" {
  description = "The name of the environment to tag resources"
  type        = string
}

variable "region" {
default = "us-east-1"
}