data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "network/network-dev.tfstate"
  }
}

data "terraform_remote_state" "dev_efs" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-dev-tf-state"
    key             = "infrastructure/efs-dev.tfstate"
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

data "aws_ami" "txn" {
  most_recent = true

  filter {
    name = "name"
    values = ["Packer-txn-Dev-shared-*"]
  }
  owners = ["645187175327"]
}

data "aws_iam_instance_profile" "ValorAmazonSSMRole" {
  name = "${var.aws_iam_instance_profile_name}"
}