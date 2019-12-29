provider "aws" {
  region = "us-east-1"
#  access_key = ""
#  secret_key = ""
}

resource "tls_private_key" "nginx" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "nginx"
  public_key = tls_private_key.nginx.public_key_openssh
}

resource "aws_instance" "nginx" {
  ami = "ami-0083662ba17882949"
  instance_type = "t2.small"
  key_name      = aws_key_pair.generated_key.key_name
  tags = {
    Name = "NGINX_SERVER"
  }
}

output "private_key" {
  value = tls_private_key.nginx.private_key_pem
}

resource "local_file" "nginx" {
  content = tls_private_key.nginx.private_key_pem
  filename = "nginx.pem"
  file_permission = "0400"
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.nginx.*.public_ip
}