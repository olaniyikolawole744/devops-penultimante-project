terraform {
  backend "s3" {
    bucket = "dirapp-744"
    key    = "miniproject/terraform.tfstate"
    region = "us-east-1"
  }
}

