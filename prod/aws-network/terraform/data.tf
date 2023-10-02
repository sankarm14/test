data "terraform_remote_state" "prod" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-prod-tf-state"
    key             = "network/network-prod.tfstate"
  }
}

data "terraform_remote_state" "staging" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "network/network-staging.tfstate"
    role_arn        = "arn:aws:iam::292894900927:role/ProdAccountAssumeRole"
  }
}

data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "network/network-dev.tfstate"
    role_arn        = "arn:aws:iam::547026705545:role/ProdAccountAssumeRole"
  }
}

data "terraform_remote_state" "vpn" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-shared-tf-state"
    key             = "network/network-shared.tfstate"
    role_arn        = "arn:aws:iam::645187175327:role/ProdAccountAssumeRole"
  }
}

data "terraform_remote_state" "shared" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-shared-tf-state"
    key             = "network/network-shared.tfstate"
    role_arn        = "arn:aws:iam::645187175327:role/ProdAccountAssumeRole"
  }
}