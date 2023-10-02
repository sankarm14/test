module "scriptserver" {
  source = "../../../../_modules/ec2"

  count                  = var.scriptserver_count
  name                   = "valor-${var.env_name}-${var.scriptserver_name}"
  ami                    = data.aws_ami.script_server.id
  instance_type          = var.scriptserver_instance_type
  subnet_id              = data.terraform_remote_state.dev.outputs.private_subnets[0]
  vpc_security_group_ids = [module.scriptserver_sg.id]
  iam_instance_profile   = data.aws_iam_instance_profile.ValorAmazonSSMRole.name
  key_name               = var.scriptserver_key_pair
  private_ip             = lookup(var.scriptserver_private_ips, count.index)
  enable_volume_tags     = true
  root_block_device = [
    {
      volume_type           = "gp3"
      volume_size           = var.scriptserver_root_volume_size
      delete_on_termination = true
      encrypted             = true
      kms_key_id            = module.scriptserver_kms_key.key_arn
    }
  ]
  tags = {
    ServerType  = "Script-Server"
    backup-1d7r = "enabled"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo yum update –y
      sudo yum upgrade
      sudo cp /home/switch_scripts/utils-scripts/check-sierra-connectivity/cronjobs /etc/cron.d/  
      sudo cp /home/switch_scripts/zabbix-scripts/switch-last-txn-time/zabbix-scripts /etc/cron.d/
      sudo mkdir -p /script/logs
      echo "Configuring fstab"
      echo "10.10.1.39:/ /script/logs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
      echo "Mounting EFS file system"
      sudo mount -a
      current_date_time=$(date "+%Y-%m-%d_%H-%M-%S")
      sudo mkdir -p /script/logs/efs_$current_date_time/var_log/httpd_logs/
      sudo mv /var/log/httpd /var/log/httpd_default
      sudo ln -s /script/logs/efs_$current_date_time/var_log/httpd_logs/ /var/log/httpd
      sudo systemctl start httpd
      sudo systemctl restart httpd
      sudo systemctl start haproxy
      EOF

}
