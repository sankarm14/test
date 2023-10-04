
build {
  source "amazon-ebs" "example" {
  ami_name      = "my-ami"
  instance_type = "t2.micro"
  region        = "us-east-1"
  # Other builder configuration settings
}
  provisioner "ansible" {
    playbook_file = "../../ansible/base.yaml"
    groups = "${var.my_variable}"
    
    user = "ec2-user"
    local_port = "22"
    use_proxy = false
    ansible_env_vars = ["ANSIBLE_ROLES_PATH=../../../../_ansible_common/roles"]
    extra_arguments    = ["--extra-vars", "my_variable=staging"]
  }

  post-processor "shell-local" {
    inline = ["echo Successfully Created"]
  }
}
