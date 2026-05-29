module "network" {
  source = "../../modules/vpc"

  name_prefix          = "cloudms-dev"
  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["us-east-1a", "us-east-1b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
}

module "security_groups" {
  source = "../../modules/security-groups"

  name_prefix      = "cloudms-dev"
  vpc_id           = module.network.vpc_id
  allowed_ssh_cidr = "0.0.0.0/0"
}

module "compute" {
  source = "../../modules/ec2"

  name_prefix       = "cloudms-dev"
  ami_id            = var.ami_id
  instance_type     = "t3.small"
  subnet_id         = module.network.public_subnet_ids[0]
  security_group_id = module.security_groups.web_security_group_id
  key_name          = var.key_name
}

module "database" {
  source = "../../modules/rds"

  name_prefix          = "cloudms-dev"
  private_subnet_ids   = module.network.private_subnet_ids
  db_security_group_id = module.security_groups.db_security_group_id
  db_name              = "cloudmsdb"
  db_username          = "cloudmsuser"
  db_password          = var.db_password
  db_instance_class    = "db.t3.micro"
  db_allocated_storage = 20
}

module "sqs" {
  source = "../../modules/sqs"

  name_prefix = "cloudms-dev"
}