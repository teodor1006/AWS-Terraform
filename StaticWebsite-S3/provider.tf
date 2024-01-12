provider "aws" {
  region = var.aws_region
}

#Cloudfront requires SSL Certificates to be provisioned in N.Virginia (us-east-1) region
provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}