source "amazon-ebs" "example" {
  ami_name = "my-ami-${var.my_variable}"
  # Other builder configuration settings
}
