module "sg" {
  source = "../../../../_modules/sg"

  attributes          = ["txnSG"]
  security_group_name = ["${var.security_group_name}"]
  allow_all_egress    = true

  rules = [
    {
      key         = "ssh"
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow SSH from anywhere"
    },
    {
      key         = "http"
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow http from anywhere"
    },
    {
      key         = "https"
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow https from anywhere"
    },
    {
      key         = "ftp"
      type        = "ingress"
      from_port   = 21
      to_port     = 21
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow ftp from anywhere"
    },
    {
      key         = "ftps"
      type        = "ingress"
      from_port   = 990
      to_port     = 990
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow sftp from anywhere"
    },
    {
      key         = "passive"
      type        = "ingress"
      from_port   = 1024
      to_port     = 1124
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow passive from anywhere"
    },
    {
      key         = "5466"
      type        = "ingress"
      from_port   = 5466
      to_port     = 5466
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow 5466 from anywhere"
    },
    {
      key         = "5890"
      type        = "ingress"
      from_port   = 5890
      to_port     = 5890
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow certification port 5890 from anywhere"
    },
    {
      key         = "7890"
      type        = "ingress"
      from_port   = 7890
      to_port     = 7890
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow UAT listener port 7890 from anywhere"
    },
    {
      key         = "7891"
      type        = "ingress"
      from_port   = 7891
      to_port     = 7891
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow UAT Dial Listener 7891 from anywhere"
    },
    {
      key         = "8881-8889"
      type        = "ingress"
      from_port   = 8881
      to_port     = 8889
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow Development ports 8881-8889 from anywhere"
    },
    {
      key         = "2049"
      type        = "ingress"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow 2049 from anywhere"
    }
  ]
  vpc_id = data.terraform_remote_state.dev.outputs.vpc_id

  #lifecycle {
  #   # Ignore changes to the security_group_ids attribute so that Terraform doesn't try to destroy the security group
  #   ignore_changes = [
  #     security_group_ids,
  #   ]
  #}
}


