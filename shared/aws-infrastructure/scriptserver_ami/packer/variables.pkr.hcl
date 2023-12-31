variable "app_name" {
    type    = string
    default = "icrs"
}
variable "vpc_id" {
    type    = string
}
variable "subnet_id" {
    type    = string
}
variable "security_group_id" {
    type    = string
}
variable "associate_public_ip_address" {
    type    = string
}
variable "env" {
    type    = string
}
variable "groups" {
    type = list(string)
    default = ["Dev", "Staging", "Prod"]
}