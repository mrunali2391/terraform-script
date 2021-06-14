variable "region" {
  default = "us-east-1"
}
variable "environment" {
  default = "Development"
}
variable "vpc_cidr" {
  description = "VPC cidr block"
}
variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 cidr block"
}
variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 cidr block"
}
variable "instance_type" {
  description= "instance type"
}
variable "instance_ami" {
 description= "instance ami"
}
variable "keyname" {
  default = "aws-june-2021"
}
