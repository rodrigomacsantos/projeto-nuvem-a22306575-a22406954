terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "cloudms"
      Environment = "dev"
      ManagedBy   = "terraform"
      Owner       = "a22306575-a22406954"
    }
  }
}