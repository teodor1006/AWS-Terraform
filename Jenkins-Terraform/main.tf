resource "aws_security_group" "jenkins-sg" {
  name        = "Jenkins Security Group"
  # Port 22: SSH, Port 443: HTTPS, Port 80: HTTP, Port 8080: Jenkins
  description = "Allow access to ports: 22, 443, 80, 8080"

  # Inbound Traffic
  ingress = [
    for port in [22, 443, 80, 8080] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}



resource "aws_instance" "webapp" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Ubuntu 22.04 
  instance_type          = "t2.micro"
  key_name               = "<Put your key name in here>"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  user_data              = templatefile("./install_jenkins.sh", {})

  tags = {
    Name = "jenkins"
  }

  root_block_device {
    volume_size = 8
  }
}
