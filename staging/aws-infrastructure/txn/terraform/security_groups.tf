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
      key         = "6789"
      type        = "ingress"
      from_port   = 6789
      to_port     = 6789
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow Demo listener port 6789 from anywhere"
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
  vpc_id = data.terraform_remote_state.staging.outputs.vpc_id

  #lifecycle {
  #   # Ignore changes to the security_group_ids attribute so that Terraform doesn't try to destroy the security group
  #   ignore_changes = [
  #     security_group_ids,
  #   ]
  #}
}


