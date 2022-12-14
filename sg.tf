resource "aws_security_group" "devops-sg" {
  description = "security group for bastion ec2"
  vpc_id      = module.network.vpc_id

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "iti_sg_ssh"
    createdBy = "terraform : Abdelrahman"
  }
}


resource "aws_security_group" "devops-sg2" {
  description = "security group for Application ec2"
  vpc_id      = module.network.vpc_id

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }
  ingress {
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
    from_port   = 3000
    to_port     = 3000
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "iti_sg_ssh_port3000"
    createdBy = "terraform : Abdelrahman"
  }
}
