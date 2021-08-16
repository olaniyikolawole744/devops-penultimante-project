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

module "server-generator" {
  source              = "../../ec2-module"
  availability-zone   = var.az2
  role                = var.role2
  purpose             = var.purpose2
  inboundport         = var.inboundport
  machine-ami         = var.machine-ami
  subnet-suffix       = var.subnet-suffix
  bootstrap-file      = data.template_file.bootstrap_file.template
}