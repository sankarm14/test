provider "aws" {
region = "${var.region}"
alias  = "network"
default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "shared"
      EnvType       = "shared-services"
    }
  }
}

provider "aws" {
region = "${var.region}"
alias  = "prod"

assume_role {
   role_arn = "arn:aws:iam::743025097748:role/SharedAccountAssumeRole"
  }

default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "prod"
      EnvType       = "production"
    }
  }
}

provider "aws" {
region = "${var.region}"
alias  = "staging"

assume_role {
   role_arn = "arn:aws:iam::292894900927:role/SharedAccountAssumeRole"
  }

default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "staging"
      EnvType       = "staging"
    }
  }
}

provider "aws" {
region = "${var.region}"
alias  = "dev"

assume_role {
   role_arn = "arn:aws:iam::547026705545:role/SharedAccountAssumeRole"
  }

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
    bucket          = "valor-shared-tf-state"
    key             = "network/network-shared.tfstate"
    dynamodb_table  = "valor-shared-tf-locktable"
    encrypt         = true
  }
}
