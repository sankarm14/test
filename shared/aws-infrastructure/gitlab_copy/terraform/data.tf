data "terraform_remote_state" "shared" {
  backend = "s3"
  config = {
    region          = "us-east-1"
    bucket          = "valor-shared-tf-state"
    key             = "network/network-shared.tfstate"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

data "aws_iam_instance_profile" "ValorAmazonSSMRole" {
  name = "${var.aws_iam_instance_profile_name}"
}