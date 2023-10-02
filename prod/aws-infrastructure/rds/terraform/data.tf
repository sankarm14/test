data "terraform_remote_state" "prod" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-prod-tf-state"
    key             = "network/network-prod.tfstate"
  }
}