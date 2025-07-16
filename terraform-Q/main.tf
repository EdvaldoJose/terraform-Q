terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Data source para obter a AMI mais recente do Amazon Linux 2
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Data source para obter a VPC padrão
data "aws_vpc" "default" {
  default = true
}

# Data source para obter as subnets da VPC padrão
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Instância EC2 com aplicação hello-world
resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.acesso_sg_terraform_q.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  
  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    project_name = "terraform-Q"
  }))

  tags = {
    Name        = "terraform-Q-web-server"
    Project     = "terraform-Q"
    CreatedWith = "Amazon Q"
    Environment = "demo"
  }
}
