terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.name
  cidr = var.vpc-cidr-block
  azs             = [var.azA, var.azB, var.azC]
  public_subnets  = [var.cidrsubA, var.cidrsubB, var.cidrsubC]
  tags = {
    Terraform = "true"
    Environment = "dev"
    name = var.vpc-tag-name
  }
}