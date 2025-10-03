variable "aws_region" {}
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "backend_image" {}
