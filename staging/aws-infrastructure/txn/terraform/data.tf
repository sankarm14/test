data "terraform_remote_state" "staging" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "network/network-staging.tfstate"
  }
}

data "terraform_remote_state" "staging_efs" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "infrastructure/efs-staging.tfstate"
  }
}

data "terraform_remote_state" "nlb" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-staging-tf-state"
    key             = "infrastructure/nlb-staging.tfstate"
  }
}
data "aws_lb_target_group_attachment" "txn_nlb" {
  name = "valor-staging-txn-Tcp-2"
}

data "aws_ami" "txn" {
  most_recent = true

  filter {
    name = "name"
    values = ["Packer-txn-Staging-shared-*"]
  }
  owners = ["645187175327"]
}

data "aws_iam_instance_profile" "ValorAmazonSSMRole" {
  name = "${var.aws_iam_instance_profile_name}"
}