module "autoscale_group" {
  source = "../../../../_modules/ec2-autoscale"

  image_id                      = data.aws_ami.bo1.id
  instance_type                 = var.instance_type
  subnet_ids                    = data.terraform_remote_state.dev.outputs.private_subnets
  health_check_type             = var.health_check_type
  min_size                      = var.min_size
  max_size                      = var.max_size
  wait_for_capacity_timeout     = var.wait_for_capacity_timeout
  associate_public_ip_address   = false
  user_data_base64              = base64encode(local.userdata)
  metadata_http_tokens_required = true
  iam_instance_profile_name     = data.aws_iam_instance_profile.ValorAmazonSSMRole.name
  security_group_ids            = [module.sg.id]
  key_name                      = var.ec2_autoscale_key_name
  target_group_arns             = data.terraform_remote_state.alb.outputs.default_target_group_arns[0]
  instance_refresh              = {
                                    strategy = "Rolling"
                                    preferences = {
                                      instance_warmup        = 5
                                      min_healthy_percentage = 50
                                    }
                                    triggers = ["tag"]
                                  }

  tags = {
    AppName                       = "BackOffice-1"
    AMI-ID                        = "${data.aws_ami.bo1.id}"
    backup-1d7r                   = "enabled"
  }

  # Auto-scaling policies and CloudWatch metric alarms
  autoscaling_policies_enabled           = true
  cpu_utilization_high_threshold_percent = var.cpu_utilization_high_threshold_percent
  cpu_utilization_low_threshold_percent  = var.cpu_utilization_low_threshold_percent

  block_device_mappings = [
    {
      device_name  = "/dev/sda1"
      no_device    = "false"
      virtual_name = "root"
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 100
        volume_type           = "gp3"
        iops                  = null
        kms_key_id            = null
        snapshot_id           = null
      }
    }
  ]
  context = module.this.context
}

locals {
  userdata = <<-USERDATA
    #!/bin/bash
    sudo yum update -y
    sudo yum upgrade
    sudo mkdir -p /bo1/logs
    echo "Mounting EFS file system"
    echo "10.10.1.21:/ /bo1/logs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
    echo "Configuring fstab"
    sudo mount -a
    current_date_time=$(date "+%Y-%m-%d_%H-%M-%S")
    sudo mkdir -p /bo1/logs/efs_$current_date_time/var_log/nginx_logs
    sudo systemctl stop nginx
    sudo mv /var/log/nginx /var/log/nginx_default
    sudo ln -s /bo1/logs/efs_$current_date_time/var_log/nginx_logs /var/log/nginx
    sudo systemctl start nginx
    sudo systemctl start haproxy
    sudo mkdir /var/run/stunnel
    sudo stunnel /home/ec2-user/stunnel.conf
  USERDATA
}


resource "aws_lb_target_group_attachment" "default_attachment" {
  target_group_arn  = data.terraform_remote_state.nlb.outputs.default_target_group_arns[0][0]
  target_id         = data.terraform_remote_state.alb.outputs.alb_arn
  port              = 443
  
}
