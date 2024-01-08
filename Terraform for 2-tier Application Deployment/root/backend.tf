terraform {
  backend "s3" {
    bucket         = "terra-2tier"
    key            = "backend/2tier.tfstate"
    region         = "us-east-1"
    dynamodb_table = "remote-backend"
  }
}