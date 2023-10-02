data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "network/network-dev.tfstate"
  }
}