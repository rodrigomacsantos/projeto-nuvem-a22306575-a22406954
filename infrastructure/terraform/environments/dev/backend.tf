terraform {
  backend "s3" {
    bucket         = "cloudms-tf-state-ue-east-1"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cloudms-tf-locks"
    encrypt        = true
  }
}