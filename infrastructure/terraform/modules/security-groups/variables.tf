variable "name_prefix" {
  type        = string
  description = "Prefix used for security group names"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH into EC2"
}