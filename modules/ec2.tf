resource "aws_instance" "server-prototype" {
  ami                         = data.aws_ami.server-ami.id
  instance_type               = var.instance-type
  key_name                    = var.key-name
  availability_zone           = var.availability-zone
  subnet_id                   = data.aws_subnet.server-subnet.id
  vpc_security_group_ids      = [aws_security_group.server-sg.id]
  user_data                   = var.bootstrap-file
  associate_public_ip_address = true
  
  tags = {
    Name        = var.purpose
    Environment = var.environment
    Role        = var.role
  }
}

