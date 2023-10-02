module "scriptserver_sg" {
    source                      = "../../../../_modules/sg"

    attributes                  = ["scriptserverSG"]
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
        }
    ]
    vpc_id  = data.terraform_remote_state.dev.outputs.vpc_id
    

}
