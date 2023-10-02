module "mytestinstance" {
    source                    = "../../../../_modules/ec2"

    count                     = var.mytestinstance_count
    name                      = "valor-${var.env_name}-${var.mytestinstance_name}"
    ami                       = data.aws_ami.bo3.id
    instance_type             = var.mytestinstance_instance_type
    subnet_id                 = data.terraform_remote_state.dev.outputs.private_subnets[0]
    vpc_security_group_ids    = [module.sg.id]
    iam_instance_profile      = data.aws_iam_instance_profile.ValorAmazonSSMRole.name
    key_name                  = var.mytestinstance_key_pair
    private_ip                = "${lookup(var.mytestinstance_private_ips,count.index)}"
    enable_volume_tags        = true
    root_block_device         = [
        {
            volume_type               = "gp3"
            volume_size               = var.mytestinstance_root_volume_size
            delete_on_termination     = true
            encrypted                 = true
            kms_key_id                = module.mytestinstance_kms_key.key_arn
        }
    ]
    tags                      =  {
    ServerType      = "Test Instance"
    backup-1d7r              = "enabled"
    }
    user_data                 = <<-EOF
      #!/bin/bash
      sudo yum update –y
      sudo yum upgrade
      EOF
}