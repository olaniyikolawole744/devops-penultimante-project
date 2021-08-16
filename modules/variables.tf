

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "availability-zone" {
  type = string
}

variable "key-name" {
  type    = string
  default = "jenkins-kp"
}

variable "environment" {
  type    = string
  default = "env"
}

variable "role" {
  type = string
}

variable "purpose" {
  type = string
}

variable "inboundport" {
  type = string
}


variable "machine-ami" {
  type = string
}

variable "az-suffix" {
  default = ["a","b","c"]
}

variable "region" {
  default = "us-east-1"
}

variable "az-suffix-2" {
  type = map
  default = {
    "us-east-1a" = 0
    "us-east-1b" = 1
    "us-east-1c" = 2
      }
}

variable "subnet-suffix" {
type = string
}

variable "bootstrap-file" {
type = string
default = ""
}



