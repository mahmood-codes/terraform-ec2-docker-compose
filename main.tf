provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "mern_server" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.mern_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user

              curl -L "https://github.com/docker/compose/releases/download/v2.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose

              mkdir -p /app
              cat <<EOT > /app/docker-compose.yml
              ${file("docker-compose.yml")}
              EOT

              cd /app
              docker-compose up -d
              EOF

  tags = {
    Name = "terraform-mern-app"
  }
}
