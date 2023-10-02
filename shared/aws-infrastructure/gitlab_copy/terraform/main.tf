module "gitlab" {
    source                    = "../../../../_modules/ec2"

    count                     = var.gitlab_count
    name                      = "${var.env_name}-${var.gitlab_name}"
    ami                       = data.aws_ami.amazon_linux.id
    instance_type             = var.gitlab_instance_type
    subnet_id                 = data.terraform_remote_state.shared.outputs.public_subnets[0]
    vpc_security_group_ids    = [module.gitlab_sg.id]
    iam_instance_profile      = data.aws_iam_instance_profile.ValorAmazonSSMRole.name
    key_name                  = var.gitlab_key_pair
    private_ip                = "${lookup(var.gitlab_private_ips,count.index)}"
    enable_volume_tags        = true
    root_block_device         = [
        {
            volume_type               = "gp3"
            volume_size               = var.gitlab_root_volume_size
            delete_on_termination     = true
            encrypted                 = true
            kms_key_id                = module.gitlab_kms_key.key_arn
        }
    ]
    tags                      =  {
    ServerType      = "Gitlab-Server"
    }
    user_data                 = <<-EOF
      #!/bin/bash
      sudo yum update –y
      curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
      sudo yum upgrade
      sudo yum install gitlab-ce
      EOF
}