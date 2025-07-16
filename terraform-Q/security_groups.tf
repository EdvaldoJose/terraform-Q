# Security Group para acesso web
resource "aws_security_group" "acesso_sg_terraform_q" {
  name        = "acesso-sg-terraform-q"
  description = "Security group para projeto terraform-Q - acesso HTTP"
  vpc_id      = data.aws_vpc.default.id

  # Regra de entrada para HTTP (porta 80)
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra de saída para permitir todo tráfego de saída
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "acesso-sg-terraform-q"
    Project     = "terraform-Q"
    CreatedWith = "Amazon Q"
  }
}
