variable "ami_id" {
  type        = string
  description = "AMI ID used for the EC2 instance"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "RDS database password"
}