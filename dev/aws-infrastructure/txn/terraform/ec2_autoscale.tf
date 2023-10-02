module "autoscale_group" {
  source = "../../../../_modules/ec2-autoscale"

  image_id                      = data.aws_ami.txn.id
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
  target_group_arns             = data.terraform_remote_state.nlb.outputs.default_target_group_arn
  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      instance_warmup        = 5
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }

  tags = {
    AppName     = "TXN-DEV"
    AMI-ID      = "${data.aws_ami.txn.id}"
    backup-1d7r = "enabled"
  }

  # Auto-scaling policies and CloudWatch metric alarms
  autoscaling_policies_enabled = true
  cpu_utilization_high_threshold_percent = var.cpu_utilization_high_threshold_percent
  cpu_utilization_low_threshold_percent  = var.cpu_utilization_low_threshold_percent

  # Resetting evaluation period to 1 from the default 2
  cpu_utilization_high_evaluation_periods = 1

  # For testing puposes enable below parameters;
  # this will auto scale instance when the CPU utilization goes higher than 40% for 30 seconds
  # FIXME: THEK; For the testing purpose resetting percent to 40
  # cpu_utilization_high_threshold_percent = 40
  # FIXME: THEK; For the testing purpose resetting high CPU duration to 30 seconds from the default 300
  # cpu_utilization_high_period_seconds = 30

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
    sudo mkdir /var/run/stunnel
    sudo mkdir -p /txn/logs
    echo "Configuring fstab"
    echo "10.10.1.29:/ /txn/logs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
    echo "Mounting EFS file system"
    sudo mount -a
    current_date_time=$(date "+%Y-%m-%d_%H-%M-%S")
    sudo mkdir -p /txn/logs/efs_$current_date_time/switch_log
    sudo mv /home/uat-switch/switch/logs /home/uat-switch/switch/logs_default
    sudo ln -s /txn/logs/efs_$current_date_time/switch_log/ /home/uat-switch/switch/logs
    sudo setenforce 0
    sudo systemctl restart haproxy
    sudo cp /home/uat-switch/switch/scripts/redis-stunnel/stunnel.conf /etc/stunnel/
    sudo stunnel /home/uat-switch/switch/scripts/redis-stunnel/stunnel.conf
    sudo systemctl start stunnel
    sudo sh -c "cd /home/uat-switch/switch/ && bash scripts/quick-startup.sh"
   
  USERDATA
}

   # sudo mkdir /var/run/stunnel/
   # sudo cp -f /home/switch/switch/conf/haproxy.cfg.uat /etc/haproxy/haproxy.cfg
   # sudo cp /home/switch/switch/cron/valor-switch-log-rotate /etc/cron.d/
   # sudo cp /home/switch/switch/cron/valor-switch-reload /etc/cron.d/