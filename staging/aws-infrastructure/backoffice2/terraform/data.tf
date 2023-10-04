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

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    region = "us-east-1"
    bucket = "valor-staging-tf-state"
    key    = "infrastructure/alb-staging.tfstate"
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

data "aws_ami" "bo2" {
  most_recent = true

  filter {
    name = "name"
    values = ["Packer-backoffice-2-staging-shared-*"]
  }
  owners = ["645187175327"]
}

data "aws_iam_instance_profile" "ValorAmazonSSMRole" {
  name = "${var.aws_iam_instance_profile_name}"
}