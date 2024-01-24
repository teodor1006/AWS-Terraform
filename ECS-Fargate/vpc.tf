module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "5.5.1"
  name                 = var.vpc_name
  cidr                 = var.vpcCIDR
  azs                  = [var.zone1, var.zone2, var.zone3]
  private_subnets      = [var.privSub1CIDR, var.privSub2CIDR, var.privSub3CIDR]
  public_subnets       = [var.pubSub1CIDR, var.pubSub2CIDR, var.pubSub3CIDR]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "Prod"
  }
  vpc_tags = {
    Name = var.vpc_name
  }
}