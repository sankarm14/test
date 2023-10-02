module "sg" {
  source = "../../../../_modules/sg"

  attributes          = ["bo2SG"]
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
      from_port   = 4430
      to_port     = 4430
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow https from anywhere"
    },
    # {
    # key         = "4430"
    # type        = "ingress"
    # from_port   = 4430
    # to_port     = 4430
    # protocol    = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]
    # self        = null
    # description = "Allow https from anywhere"
    # },
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
    }
  ]
  vpc_id = data.terraform_remote_state.dev.outputs.vpc_id
}
