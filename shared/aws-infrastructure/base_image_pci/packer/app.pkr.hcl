packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = formatdate("YYYY-MM-DD-hhmm", timestamp())
}

data "amazon-ami" "red_hat_8" {
    filters = {
        virtualization-type = "hvm"
        name = "RHEL-8.6.0_HVM-20220503-x86_64-2-Hourly2-GP2*"
        root-device-type = "ebs"
    }
    owners = ["309956199498"]
    most_recent = true
}

source "amazon-ebs" "app" {
  ami_name                          = "Packer-${var.app_name}-${var.env}-${local.timestamp}"
  instance_type                     = "t2.micro"
  region                            = "us-east-1"
  source_ami                        = data.amazon-ami.red_hat_8.id
  ssh_username                      = "ec2-user"
  ssh_timeout                       = "5m"
  vpc_id                            = "${var.vpc_id}"
  subnet_id                         = "${var.subnet_id}"
  security_group_id                 = "${var.security_group_id}"
  associate_public_ip_address       = "${var.associate_public_ip_address}"
  ami_org_arns                      = ["arn:aws:organizations::323166134951:organization/o-bzmh8rlsm3"]
  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 40
    volume_type = "gp3"
    delete_on_termination = true
  }
  tags = {
    Env  = "${var.env}"
    Name = "Packer-${var.app_name}-${var.env}"
  }
}

build {
  sources = ["source.amazon-ebs.app"]
  
  provisioner "ansible" {
    playbook_file = "../ansible/base.yaml"
    groups = ["prod"]
    user = "ec2-user"
    local_port = "22"
    use_proxy = false
    ansible_env_vars = ["ANSIBLE_ROLES_PATH=../../../../_ansible_common/roles"]
    #extra_arguments = [ "-t", "level1-server"]
    #pause_before = "120s"
  }

  post-processor "shell-local" {
    inline = ["echo Successfully Created"]
  }
}