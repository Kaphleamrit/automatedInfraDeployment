provider "aws" {
  region = "us-east-1"
}

# Security Group allowing SSH, HTTP, and HTTPS traffic
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"

  description = "Allow SSH, HTTP, and HTTPS traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Server Security Group"
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-04a81a99f5ec58529"                    # us-east-1 Ubuntu
  instance_type = "t2.micro"
  key_name      = "automatedInfraKey"

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Static Website Server"
  }
}

# Output the public IP of the instance
output "public_ip" {
  value = aws_instance.web.public_ip
}


resource "local_file" "ansible_inventory" {
  content  = <<-EOT
  [webservers]
  ${aws_instance.web.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/your_private_key.pem
  EOT
  filename = "${path.module}/ansible/hosts"
}