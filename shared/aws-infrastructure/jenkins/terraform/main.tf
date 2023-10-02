module "jenkins" {
    source                    = "../../../../_modules/ec2"

    count                     = var.jenkins_count
    name                      = "${var.env_name}-${var.jenkins_name}"
    ami                       = data.aws_ami.amazon_linux.id
    instance_type             = var.jenkins_instance_type
    subnet_id                 = data.terraform_remote_state.shared.outputs.private_subnets[0]
    vpc_security_group_ids    = [module.jenkins_sg.id]
    iam_instance_profile      = data.aws_iam_instance_profile.ValorAmazonSSMRole.name
    key_name                  = var.jenkins_key_pair
    private_ip                = "${lookup(var.jenkins_private_ips,count.index)}"
    enable_volume_tags        = true
    root_block_device         = [
        {
            volume_type               = "gp3"
            volume_size               = var.jenkins_root_volume_size
            delete_on_termination     = true
            encrypted                 = true
            kms_key_id                = module.jenkins_kms_key.key_arn
        }
    ]
    tags                      =  {
    ServerType      = "Jenkins-Server"
    }
    user_data                 = <<-EOF
      #!/bin/bash
      sudo yum update –y
      sudo wget -O /etc/yum.repos.d/jenkins.repo \
          https://pkg.jenkins.io/redhat-stable/jenkins.repo
       sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
       sudo yum upgrade
       sudo amazon-linux-extras install java-openjdk11 -y
       sudo systemctl daemon-reload
       sudo systemctl start jenkins
       sudo systemctl enable jenkins
       sudo systemctl status jenkins
      EOF
}