provider "aws" {
region = "${var.region}"
alias  = "staging"
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
alias  = "prod"

assume_role {
   role_arn = "arn:aws:iam::743025097748:role/StagingAccountAssumeRole"
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
alias  = "dev"

assume_role {
   role_arn = "arn:aws:iam::547026705545:role/StagingAccountAssumeRole"
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

provider "aws" {
region = "${var.region}"
alias  = "shared"

assume_role {
   role_arn = "arn:aws:iam::645187175327:role/StagingAccountAssumeRole"
  }

default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "shared"
      EnvType       = "shared"
    }
  }
}

provider "aws" {
region = "${var.region}"
alias  = "vpn"

assume_role {
   role_arn = "arn:aws:iam::645187175327:role/StagingAccountAssumeRole"
  }

default_tags {
    tags = {
      Terraform     = "true"
      map-migrated  = "d-server-01s1mj6xrxt86f"
      EnvName       = "shared"
      EnvType       = "shared"
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
    key             = "network/network-staging.tfstate"
    dynamodb_table  = "valor-staging-tf-locktable"
    encrypt         = true
  }
}
