provider "aws" {
region = "${var.region}"
default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "shared"
      EnvType       = "shared-services"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Terraform Backend
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    region          = "us-east-1"
    bucket          = "valor-shared-tf-state"
    key             = "gitlab/gitlab-shared.tfstate"
    dynamodb_table  = "valor-shared-tf-locktable"
    encrypt         = true
  }
}
