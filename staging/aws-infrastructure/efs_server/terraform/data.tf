data "terraform_remote_state" "staging" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "network/network-staging.tfstate"
  }
}

data "aws_ami" "efs_server" {
  most_recent = true

  filter {
    name = "name"
    values = ["Packer-efs-base-shared-*"]
  }
  owners = ["645187175327"]
}

data "aws_iam_instance_profile" "ValorAmazonSSMRole" {
  name = "${var.aws_iam_instance_profile_name}"
}

#data "terraform_remote_state" "scriptserver" {
#  backend = "s3"
#  config = {
#    region          = "us-east-1"
#    bucket          = "valor-dev-tf-state"
#    key             = "network/scriptserver-dev.tfstate"
#  }
#}