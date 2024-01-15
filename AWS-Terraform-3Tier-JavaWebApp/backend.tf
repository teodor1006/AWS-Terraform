terraform {
  backend "s3" {
    bucket  = "javaweb-98"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}