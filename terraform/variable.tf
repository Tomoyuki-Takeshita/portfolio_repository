# プロジェクトの名前
variable "project_prefix" {}

# provider.tf
variable "aws_config" {
  type = map(string)
}

# network.tf
variable "vpc" {
  type = map(string)
}

variable "igw_tagname" {}

variable "public_subnet" {
  type = map(map(string))
}

variable "private_subnet" {
  type = map(map(string))
}

variable "public_route_table" {
  type = map(string)
}

variable "private_route_table" {
  type = map(string)
}

# ec2_alb.tf
variable "alb_sg" {
  type = map(string)
}

variable "alb_sg_ingrees_cidr_blocks" {
  type = list(string)
}

variable "alb_sg_ingrees_port" {
  type = set(string)
}

variable "alb" {
  type = map(string)
}

variable "alb_target_group" {
  type = map(string)
}

variable "ec2_config" {
  type = map(map(string))
}

variable "ec2_sg" {
  type = map(string)
}

variable "ec2_sg_ingrees_port" {
  type = set(string)
}

# rds.tf
variable "rds_sg" {
  type = map(string)
}

variable "rds_sg_inbound" {
  type = map(string)
}

variable "rds_config" {
  type = map(string)
}


