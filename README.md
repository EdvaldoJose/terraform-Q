# Projeto terraform-Q com Amazon-Q

Este projeto foi criado com **Amazon Q** e demonstra uma aplicação web hello-world simples hospedada na AWS usando Terraform.

## 🚀 Recursos Criados

- **Instância EC2**: Servidor web com Amazon Linux 2
- **Security Group**: `acesso-sg-terraform-q` (porta 80 aberta)
- **Role IAM**: `ssm-q` para acesso via SSM
- **Aplicação Web**: Hello-world com design moderno

## 📋 Pré-requisitos

- Terraform instalado (>= 1.0)
- AWS CLI configurado
- Credenciais AWS válidas
- Session Manager Plugin (para acesso SSM)

## 🛠️ Como usar

### 1. Inicializar o Terraform
```bash
cd terraform-Q
terraform init
```

### 2. Planejar a infraestrutura
```bash
terraform plan
```

### 3. Aplicar as configurações
```bash
terraform apply
```

### 4. Acessar a aplicação
Após a aplicação, use o output `web_url` para acessar a aplicação no navegador.

### 5. Conectar via SSM
```bash
aws ssm start-session --target <INSTANCE_ID>
```

## 🔧 Configurações

### Variáveis disponíveis:
- `aws_region`: Região AWS (padrão: us-east-1)
- `instance_type`: Tipo da instância (padrão: t2.micro)
- `project_name`: Nome do projeto (padrão: terraform-Q)

### Para personalizar:
```bash
terraform apply -var="aws_region=us-west-2" -var="instance_type=t3.micro"
```

## 📊 Outputs

- `instance_id`: ID da instância EC2
- `instance_public_ip`: IP público da instância
- `web_url`: URL da aplicação web
- `ssm_connect_command`: Comando para conectar via SSM
- `security_group_id`: ID do Security Group
- `iam_role_name`: Nome da role IAM

## 🧹 Limpeza

Para destruir todos os recursos:
```bash
terraform destroy
```

## 🔒 Segurança

- Acesso à instância apenas via SSM (sem chaves SSH)
- Security Group restrito à porta 80
- Role IAM com permissões mínimas necessárias

## 📝 Notas

- A aplicação pode levar alguns minutos para ficar disponível após a criação da instância
- O custo da instância t2.micro está incluído no free tier da AWS
- Este é um projeto de demonstração - não recomendado para produção sem ajustes de segurança adicionais

---
**Criado com Amazon Q** 🤖
