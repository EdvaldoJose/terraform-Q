# Role IAM para acesso SSM
resource "aws_iam_role" "ssm_q" {
  name = "ssm-q"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "ssm-q"
    Project     = "terraform-Q"
    CreatedWith = "Amazon Q"
  }
}

# Anexar a política gerenciada do SSM à role
resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
  role       = aws_iam_role.ssm_q.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance profile para a role SSM
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-q-profile"
  role = aws_iam_role.ssm_q.name

  tags = {
    Name        = "ssm-q-profile"
    Project     = "terraform-Q"
    CreatedWith = "Amazon Q"
  }
}
