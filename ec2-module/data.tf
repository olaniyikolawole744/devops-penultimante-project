data "aws_ami" "server-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.machine-ami]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}

data "aws_vpc" "server-vpc" {
   tags = {
      name = "devop-vpc"
   }
}

data "aws_subnet" "server-subnet" {
vpc_id = data.aws_vpc.server-vpc.id
filter {
    name   = "tag:Name"
    values = ["devop-vpc-public-${var.availability-zone}"]
 }
}










