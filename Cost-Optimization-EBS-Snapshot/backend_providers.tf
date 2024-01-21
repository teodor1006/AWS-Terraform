terraform {
  backend "s3" {
    bucket  = "ebs-bucket-98"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
