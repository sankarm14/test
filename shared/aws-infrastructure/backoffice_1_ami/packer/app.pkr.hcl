packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# Define variables for customization
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-07619808e052ef4c0" # Replace with your desired source AMI ID
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_username" {
  type    = string
  default = "ec2-user"
}

# Define the source block for the Amazon EC2 builder
source "amazon-ebs" "app" {
  ami_name                          = "my-ami"
  instance_type                     = var.instance_type
  region                            = var.aws_region
  source_ami                        = var.source_ami
  ssh_username                      = var.ssh_username
  ssh_timeout                       = "5m"
  vpc_id                            = "vpc-0eff147f6a1f97e69" # Replace with your VPC ID
  subnet_id                         = "subnet-0fcf80726304004cf" # Replace with your subnet ID
  security_group_id                 = "sg-0420742999d617998" # Replace with your security group ID
  associate_public_ip_address       = true
  ami_block_device_mappings {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp2"
    delete_on_termination = true
  }
  tags = {
    Name = "test"
  }
}
build {
  sources = ["source.amazon-ebs.app"]
  
  provisioner "ansible" {
    playbook_file = "../../ansible/base.yaml"
    // groups = "staging"
    groups = "${var.env}"
    user = "ec2-user"
    local_port = "22"
    use_proxy = false
    ansible_env_vars = ["ANSIBLE_ROLES_PATH=../../../../_ansible_common/roles"]
    extra_arguments    = ["--extra-vars", "my_variable=staging"]
  }

  post-processor "shell-local" {
    inline = ["echo Successfully Created"]
  }
}
