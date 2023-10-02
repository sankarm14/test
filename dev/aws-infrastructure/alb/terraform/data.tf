data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "network/network-dev.tfstate"
  }
}

data "terraform_remote_state" "bo1" {
  backend = "s3" 
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "infrastructure/bo1-dev.tfstate" 
  }
}

data "terraform_remote_state" "nlb" {
  backend = "s3" 
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "infrastructure/nlb-dev.tfstate" 
  }
}

data "aws_acm_certificate" "issued" {
  domain  = "*.valorpaytech.com" 
  statuses = ["ISSUED"]
}