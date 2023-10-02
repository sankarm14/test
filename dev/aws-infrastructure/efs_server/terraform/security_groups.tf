module "efsserver_sg" {
    source                      = "../../../../_modules/sg"

    attributes                  = ["efsserverSG"]
    security_group_name         = ["${var.security_group_name}"]
    allow_all_egress            = true

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
        key         = "tcp"
        type        = "ingress"
        from_port   = 2049
        to_port     = 2049
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        self        = null
        description = "Allow tcp from anywhere"
        }
    ]
    vpc_id  = data.terraform_remote_state.dev.outputs.vpc_id
    

}