terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.00"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "build" {
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "AWS_ax"
  vpc_security_group_ids = [aws_security_group.ssh_http_ingress.id]
  user_data = file("init.sh")
  
  tags = {
    Name = "build"
  }
}

resource "aws_instance" "web" {
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "AWS_ax"
  vpc_security_group_ids = [aws_security_group.ssh_http_ingress.id]
  user_data = file("init.sh")
  
  tags = {
    Name = "web"
  }
}

resource "aws_security_group" "ssh_http_ingress" {
  name        = "ssh_http_ingress"
  description = "ssh_http_ingress"

  ingress {
      description      = "http"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "http"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "ssh_http_ingress"
  }
}

provisioner "local-exec" {
    command = "echo '[build]' >> hosts"
    command = "echo '${aws_instance.build.public_ip}' >> hosts"
    command = "echo '[web]' >> hosts"
    command = "echo '${aws_instance.web.public_ip}' >> hosts"
  }

output "instance_public_ip" {
  description = "IP address web"
  value       = aws_instance.web.public_ip
}
