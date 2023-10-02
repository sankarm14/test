module "sg" {
    source                      = "../../../../_modules/sg"

    attributes                  = ["RDSSG"]
    security_group_name         = ["${var.security_group_name}"]
    allow_all_egress            = true

    rules = [
        {
        key         = "ssh"
        type        = "ingress"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        self        = null
        description = "Allow SSH from anywhere"
        }
    ]
    vpc_id  = data.terraform_remote_state.dev.outputs.vpc_id
}