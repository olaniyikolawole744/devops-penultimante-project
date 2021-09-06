terraform {
  backend "s3" {
    bucket = "dirapp-744"
    key    = "ansible/terraform.tfstate"
    region = "us-east-1"
  }
}

