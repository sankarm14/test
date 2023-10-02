module "efsserver" {
  source = "../../../../_modules/ec2"

  count                  = var.efsserver_count
  name                   = "valor-${var.env_name}-${var.efsserver_name}"
  ami                    = data.aws_ami.efs_server.id
  instance_type          = var.efsserver_instance_type
  subnet_id              = data.terraform_remote_state.staging.outputs.private_subnets[0]
  vpc_security_group_ids = [module.efsserver_sg.id]
  iam_instance_profile   = data.aws_iam_instance_profile.ValorAmazonSSMRole.name
  key_name               = var.efsserver_key_pair
  private_ip             = lookup(var.efsserver_private_ips, count.index)
  enable_volume_tags     = true
  root_block_device = [
    {
      volume_type           = "gp3"
      volume_size           = var.efsserver_root_volume_size
      delete_on_termination = true
      encrypted             = true
      kms_key_id            = module.efsserver_kms_key.key_arn
    }
  ]
  tags = {
    ServerType  = "efs-Server"
    backup-1d7r = "enabled"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo yum update –y
      sudo yum upgrade
      sudo mkdir -p /home/bo1-logs/bo1/logs
      echo "Mounting EFS file system"
      echo "10.20.1.245:/ /home/bo1-logs/bo1/logs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
      echo "Configuring fstab"
      sudo mount -a
      sudo mkdir -p /home/bo2-logs/bo2/logs
      echo "Configuring fstab"
      echo "10.20.1.45:/ /home/bo2-logs/bo2/logs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
      echo "Mounting EFS file system"
      sudo mount -a
      sudo mkdir -p /home/script-logs/script/logs
      echo "Configuring fstab"
      echo "10.20.1.65:/ /home/script-logs/script/logs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
      echo "Mounting EFS file system"
      sudo mount -a
      sudo mkdir -p /home/txn-logs/txn/logs
      echo "Configuring fstab"
      echo "10.20.1.247:/ /home/txn-logs/txn/logs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
      echo "Mounting EFS file system"
      sudo mount -a
      EOF
}