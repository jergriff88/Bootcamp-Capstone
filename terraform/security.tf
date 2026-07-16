resource "aws_key_pair" "capstone" {
  key_name   = var.key_pair_name
  public_key = file(pathexpand(var.public_key_path))

  tags = {
    Name = var.key_pair_name
  }
}

resource "aws_security_group" "linux" {
  name        = "${var.project_name}-${var.environment}-linux-sg"
  description = "Allow SSH access to the capstone Linux host"
  vpc_id      = aws_vpc.capstone.id

  ingress {
    description = "SSH access to the capstone Linux host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-linux-sg"
  }
}
