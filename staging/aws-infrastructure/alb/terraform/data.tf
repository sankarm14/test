data "terraform_remote_state" "staging" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "network/network-staging.tfstate"
  }
}

#data "terraform_remote_state" "bo1" {
#  backend = "s3" 
#  config = {
#    region          = "us-east-1"
#    bucket          = "valor-staging-tf-state"
#    key             = "infrastructure/bo1-staging.tfstate" 
#  }
#}

data "terraform_remote_state" "nlb" {
  backend = "s3" 
  config = {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "infrastructure/nlb-staging.tfstate" 
  }
}

data "aws_acm_certificate" "issued" {
  domain  = "*.valorpaytech.com" 
  statuses = ["ISSUED"]
}