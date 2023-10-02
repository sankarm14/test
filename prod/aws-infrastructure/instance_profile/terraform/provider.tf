provider "aws" {
region = "${var.region}"
default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "prod"
      EnvType       = "production"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Terraform Backend
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    region          = "us-east-1"
    bucket          = "valor-prod-tf-state"
    key             = "infrastructure/ssm-prod.tfstate"
    dynamodb_table  = "valor-prod-tf-locktable"
    encrypt         = true
  }
}
