provider "aws" {
  region = "ap-south-1"  # Change to your desired region
}

resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-ec2-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Change path to your public key
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
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
}

resource "aws_instance" "nginx_server" {
  ami                    = "ami-0b0dcb5067f052a63"  # Amazon Linux 2 in ap-south-1; change if needed
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terraform_key.key_name
  security_groups        = [aws_security_group.allow_ssh_http.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "Terraform-Nginx-Server"
  }
}

output "public_ip" {
  value = aws_instance.nginx_server.public_ip
}
