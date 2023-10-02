provider "aws" {
region = "${var.region}"
alias  = "dev"
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
alias  = "prod"

assume_role {
   role_arn = "arn:aws:iam::743025097748:role/DevAccountAssumeRole"
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
   role_arn = "arn:aws:iam::292894900927:role/DevAccountAssumeRole"
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
alias  = "shared"

assume_role {
   role_arn = "arn:aws:iam::645187175327:role/DevAccountAssumeRole"
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
   role_arn = "arn:aws:iam::645187175327:role/DevAccountAssumeRole"
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
    bucket          = "valor-dev-tf-state"
    key             = "network/network-dev.tfstate"
    dynamodb_table  = "valor-dev-tf-locktable"
    encrypt         = true
  }
}
