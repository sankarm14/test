data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "network/network-dev.tfstate"
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
  domain  = "*.isoaccess.com" 
  statuses = ["ISSUED"]
}