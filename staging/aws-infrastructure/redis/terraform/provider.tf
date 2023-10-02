provider "aws" {
region = "${var.region}"
default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "staging"
      EnvType       = "staging"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Terraform Backend
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "infrastructure/redis-staging.tfstate"
    dynamodb_table  = "valor-staging-tf-locktable"
    encrypt         = true
  }
}
