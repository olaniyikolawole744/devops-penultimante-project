terraform {
  backend "s3" {
    bucket = "kafka-bucket744"
    key    = "project/kafka/terraform.tfstate"
    region = "us-west-2"
  }
}

