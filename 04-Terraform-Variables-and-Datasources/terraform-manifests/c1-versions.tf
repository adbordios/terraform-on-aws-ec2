# Terraform Block
terraform {
  required_version = "~> 1.9.8" # allows 1.9.x , deny 1.10.x
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}


