provider "aws" {
region = "${var.region}"
default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "dev"
      EnvType       = "development"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Terraform Backend
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "infrastructure/nlb-dev.tfstate"
    dynamodb_table  = "valor-dev-tf-locktable"
    encrypt         = true
  }
}
