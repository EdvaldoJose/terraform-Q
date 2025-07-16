# Guia Completo: Git Branches e Repositórios GitHub

Este guia explica como criar branches locais e repositórios GitHub para os projetos da Formação AWS.

## 📁 Estrutura dos Projetos

```
/home/eddev/Formacao-AWS/bia-IA-AWS/
├── aws-serverless-mcp/     # Servidor MCP Serverless
├── ec2-amazon-Q/          # EC2 + PostgreSQL RDS
└── terraform-Q/           # Projeto Terraform (a ser criado)
```

## 🎯 Objetivos

1. Criar uma branch para cada projeto
2. Criar repositórios GitHub separados
3. Fazer push de cada projeto para seu respectivo repositório
4. Manter organização e versionamento adequados

## 📋 Pré-requisitos

### 1. Verificar Git
```bash
git --version
# Se não estiver instalado: sudo yum install git -y
```

### 2. Configurar Git (se ainda não configurado)
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

### 3. Configurar GitHub CLI (opcional, mas recomendado)
```bash
# Instalar GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Fazer login
gh auth login
```

## 🚀 Passo a Passo Completo

### Etapa 1: Preparar o Diretório Principal

```bash
# Navegar para o diretório principal
cd /home/eddev/Formacao-AWS/bia-IA-AWS

# Inicializar repositório Git (se ainda não foi feito)
git init

# Verificar status
git status
```

### Etapa 2: Criar e Configurar Branches

#### 2.1 Branch para aws-serverless-mcp
```bash
# Criar e mudar para a branch
git checkout -b aws-serverless-mcp

# Adicionar apenas os arquivos do projeto
git add aws-serverless-mcp/

# Fazer commit inicial
git commit -m "feat: adicionar projeto AWS Serverless MCP

- Servidor MCP serverless usando AWS Lambda
- API Gateway para comunicação HTTP
- Funcionalidades: S3, Lambda, CloudWatch
- Deploy automatizado com SAM"

# Voltar para main
git checkout main
```

#### 2.2 Branch para ec2-amazon-Q
```bash
# Criar e mudar para a branch
git checkout -b ec2-amazon-Q

# Adicionar apenas os arquivos do projeto
git add ec2-amazon-Q/

# Fazer commit inicial
git commit -m "feat: adicionar projeto EC2 Amazon Q

- Instância EC2 t4g.medium com Amazon Linux 2023
- Integração com PostgreSQL RDS
- Scripts de deploy e configuração automatizados
- Monitoramento e troubleshooting incluídos"

# Voltar para main
git checkout main
```

#### 2.3 Branch para terraform-Q (se existir)
```bash
# Verificar se o diretório existe
if [ -d "terraform-Q" ]; then
    git checkout -b terraform-Q
    git add terraform-Q/
    git commit -m "feat: adicionar projeto Terraform Q

- Infraestrutura como código com Terraform
- Provisionamento automatizado de recursos AWS
- Configurações modulares e reutilizáveis"
    git checkout main
fi
```

### Etapa 3: Criar Repositórios GitHub

#### 3.1 Método 1: Usando GitHub CLI (Recomendado)

```bash
# Para aws-serverless-mcp
gh repo create aws-serverless-mcp --public --description "Servidor MCP serverless na AWS usando Lambda e API Gateway"

# Para ec2-amazon-Q
gh repo create ec2-amazon-Q --public --description "Infraestrutura EC2 com PostgreSQL RDS para Amazon Q"

# Para terraform-Q (se aplicável)
gh repo create terraform-Q --public --description "Infraestrutura AWS com Terraform"
```

#### 3.2 Método 2: Via Interface Web GitHub

1. Acesse https://github.com/EdvaldoJose
2. Clique em "New repository"
3. Configure cada repositório:

**aws-serverless-mcp:**
- Repository name: `aws-serverless-mcp`
- Description: `Servidor MCP serverless na AWS usando Lambda e API Gateway`
- Public
- Não inicializar com README (já temos conteúdo)

**ec2-amazon-Q:**
- Repository name: `ec2-amazon-Q`
- Description: `Infraestrutura EC2 com PostgreSQL RDS para Amazon Q`
- Public
- Não inicializar com README

**terraform-Q:**
- Repository name: `terraform-Q`
- Description: `Infraestrutura AWS com Terraform`
- Public
- Não inicializar com README

### Etapa 4: Fazer Push dos Projetos

#### 4.1 Push aws-serverless-mcp
```bash
# Mudar para a branch
git checkout aws-serverless-mcp

# Adicionar remote origin
git remote add origin-serverless https://github.com/EdvaldoJose/aws-serverless-mcp.git

# Fazer push
git push -u origin-serverless aws-serverless-mcp:main
```

#### 4.2 Push ec2-amazon-Q
```bash
# Mudar para a branch
git checkout ec2-amazon-Q

# Adicionar remote origin
git remote add origin-ec2 https://github.com/EdvaldoJose/ec2-amazon-Q.git

# Fazer push
git push -u origin-ec2 ec2-amazon-Q:main
```

#### 4.3 Push terraform-Q (se aplicável)
```bash
# Mudar para a branch
git checkout terraform-Q

# Adicionar remote origin
git remote add origin-terraform https://github.com/EdvaldoJose/terraform-Q.git

# Fazer push
git push -u origin-terraform terraform-Q:main
```

### Etapa 5: Verificar e Organizar

```bash
# Voltar para main
git checkout main

# Verificar branches locais
git branch

# Verificar remotes
git remote -v

# Ver histórico
git log --oneline --graph --all
```

## 📝 Scripts Automatizados

### Script para Criar Todas as Branches
```bash
#!/bin/bash
# create-branches.sh

cd /home/eddev/Formacao-AWS/bia-IA-AWS

echo "🌿 Criando branches para os projetos..."

# Branch aws-serverless-mcp
if [ -d "aws-serverless-mcp" ]; then
    git checkout -b aws-serverless-mcp 2>/dev/null || git checkout aws-serverless-mcp
    git add aws-serverless-mcp/
    git commit -m "feat: adicionar projeto AWS Serverless MCP" || echo "Commit já existe"
    echo "✅ Branch aws-serverless-mcp criada"
fi

# Branch ec2-amazon-Q
if [ -d "ec2-amazon-Q" ]; then
    git checkout -b ec2-amazon-Q 2>/dev/null || git checkout ec2-amazon-Q
    git add ec2-amazon-Q/
    git commit -m "feat: adicionar projeto EC2 Amazon Q" || echo "Commit já existe"
    echo "✅ Branch ec2-amazon-Q criada"
fi

# Branch terraform-Q
if [ -d "terraform-Q" ]; then
    git checkout -b terraform-Q 2>/dev/null || git checkout terraform-Q
    git add terraform-Q/
    git commit -m "feat: adicionar projeto Terraform Q" || echo "Commit já existe"
    echo "✅ Branch terraform-Q criada"
fi

git checkout main
echo "🎉 Todas as branches foram criadas!"
```

### Script para Push Automático
```bash
#!/bin/bash
# push-all-projects.sh

cd /home/eddev/Formacao-AWS/bia-IA-AWS

echo "🚀 Fazendo push de todos os projetos..."

# Push aws-serverless-mcp
if git show-branch aws-serverless-mcp 2>/dev/null; then
    git checkout aws-serverless-mcp
    git remote add origin-serverless https://github.com/EdvaldoJose/aws-serverless-mcp.git 2>/dev/null || true
    git push -u origin-serverless aws-serverless-mcp:main
    echo "✅ aws-serverless-mcp enviado"
fi

# Push ec2-amazon-Q
if git show-branch ec2-amazon-Q 2>/dev/null; then
    git checkout ec2-amazon-Q
    git remote add origin-ec2 https://github.com/EdvaldoJose/ec2-amazon-Q.git 2>/dev/null || true
    git push -u origin-ec2 ec2-amazon-Q:main
    echo "✅ ec2-amazon-Q enviado"
fi

# Push terraform-Q
if git show-branch terraform-Q 2>/dev/null; then
    git checkout terraform-Q
    git remote add origin-terraform https://github.com/EdvaldoJose/terraform-Q.git 2>/dev/null || true
    git push -u origin-terraform terraform-Q:main
    echo "✅ terraform-Q enviado"
fi

git checkout main
echo "🎉 Todos os projetos foram enviados para GitHub!"
```

## 🔧 Comandos Úteis

### Gerenciar Branches
```bash
# Listar todas as branches
git branch -a

# Mudar de branch
git checkout nome-da-branch

# Deletar branch local
git branch -d nome-da-branch

# Deletar branch remota
git push origin --delete nome-da-branch
```

### Gerenciar Remotes
```bash
# Listar remotes
git remote -v

# Adicionar remote
git remote add nome-remote url-do-repositorio

# Remover remote
git remote remove nome-remote

# Renomear remote
git remote rename nome-antigo nome-novo
```

### Sincronização
```bash
# Buscar mudanças do remote
git fetch origin

# Fazer pull de uma branch específica
git pull origin nome-da-branch

# Push forçado (cuidado!)
git push --force-with-lease origin nome-da-branch
```

## 🛡️ Boas Práticas

### 1. Commits Semânticos
```bash
# Tipos de commit
feat: nova funcionalidade
fix: correção de bug
docs: documentação
style: formatação
refactor: refatoração
test: testes
chore: tarefas de manutenção

# Exemplos
git commit -m "feat: adicionar autenticação AWS"
git commit -m "fix: corrigir erro de conexão RDS"
git commit -m "docs: atualizar README com instruções"
```

### 2. Estrutura de Branches
```
main (branch principal)
├── aws-serverless-mcp (projeto 1)
├── ec2-amazon-Q (projeto 2)
└── terraform-Q (projeto 3)
```

### 3. Arquivos .gitignore
Criar `.gitignore` em cada projeto:

```gitignore
# Node.js
node_modules/
npm-debug.log*
.npm

# AWS
.aws-sam/
*.pem

# Terraform
*.tfstate
*.tfstate.*
.terraform/

# Logs
*.log

# Environment
.env
.env.local

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
```

## 🚨 Troubleshooting

### Problema: Branch já existe
```bash
# Solução: usar checkout em vez de checkout -b
git checkout nome-da-branch
```

### Problema: Remote já existe
```bash
# Solução: remover e adicionar novamente
git remote remove origin-nome
git remote add origin-nome url-do-repositorio
```

### Problema: Conflitos de merge
```bash
# Solução: resolver conflitos manualmente
git status
# Editar arquivos em conflito
git add .
git commit -m "resolve: conflitos de merge"
```

### Problema: Credenciais GitHub
```bash
# Usar token de acesso pessoal
# GitHub Settings > Developer settings > Personal access tokens
# Usar token como senha ao fazer push
```

## 📚 Recursos Adicionais

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com)
- [GitHub CLI](https://cli.github.com)
- [Conventional Commits](https://www.conventionalcommits.org)

## ✅ Checklist Final

- [ ] Git configurado com nome e email
- [ ] Repositório principal inicializado
- [ ] Branches criadas para cada projeto
- [ ] Commits iniciais feitos
- [ ] Repositórios GitHub criados
- [ ] Push realizado para cada repositório
- [ ] READMEs atualizados em cada projeto
- [ ] .gitignore configurado
- [ ] Documentação completa

---

**Autor**: Amazon Q  
**Data**: $(date)  
**Versão**: 1.0
