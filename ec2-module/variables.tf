variable "bootstrap-file" {
type = string
default = ""
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "availability-zone" {
  type = string
  default = ""
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
  default = ""
}

variable "purpose" {
  type = string
  default  = ""
}

variable "inboundport" {
  type = string
  default = ""
}

variable "machine-ami" {
  type = string
  default = ""
}

variable "inboundport2" {
  type = string
  default = ""
}