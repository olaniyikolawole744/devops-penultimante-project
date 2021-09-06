terraform {
  backend "s3" {
    bucket = "dirapp-744"
    key    = "devapp/terraform.tfstate"
    region = "us-east-1"
  }
}

