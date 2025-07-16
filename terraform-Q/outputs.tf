output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.web_server.id
}

output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.web_server.public_ip
}

output "instance_public_dns" {
  description = "DNS público da instância EC2"
  value       = aws_instance.web_server.public_dns
}

output "web_url" {
  description = "URL da aplicação web"
  value       = "http://${aws_instance.web_server.public_ip}"
}

output "ssm_connect_command" {
  description = "Comando para conectar via SSM"
  value       = "aws ssm start-session --target ${aws_instance.web_server.id}"
}

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.acesso_sg_terraform_q.id
}

output "iam_role_name" {
  description = "Nome da role IAM para SSM"
  value       = aws_iam_role.ssm_q.name
}
