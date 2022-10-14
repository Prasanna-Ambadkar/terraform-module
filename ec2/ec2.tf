data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "this" {
  count                       = length(var.availability_zone)
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = var.subnet_id
  instance_type               = var.instance_type
  associate_public_ip_address = false
  #availability_zone           = element(var.availability_zone, count.index)
  key_name                    = var.key_name
  security_groups             = ["aws_security_group.allow_tls.id"]
  #user_data                   = var.user_data
  tags = {
    Name = format("ec2-instance-%s-%s", var.tag, var.environment)
  }
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
}