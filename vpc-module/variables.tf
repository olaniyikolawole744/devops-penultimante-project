variable "vpc-cidr-block" {
    default = "10.0.0.0/16"
}

variable "vpc-tag-name" {
    default = "devop-vpc"
}

variable "az-suffix" {
  default = ["a","b","c"]
}

variable "region" {
  default = "us-west-2"
}