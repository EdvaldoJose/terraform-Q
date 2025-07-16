#!/bin/bash

# Atualizar o sistema
yum update -y

# Instalar Apache HTTP Server
yum install -y httpd

# Iniciar e habilitar o Apache
systemctl start httpd
systemctl enable httpd

# Criar página HTML hello-world
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World - Terraform Q</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: white;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        p {
            font-size: 1.2em;
            margin: 15px 0;
            line-height: 1.6;
        }
        .highlight {
            color: #FFD700;
            font-weight: bold;
        }
        .aws-logo {
            font-size: 1.5em;
            color: #FF9900;
            font-weight: bold;
        }
        .footer {
            margin-top: 30px;
            font-size: 0.9em;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🌟 Hello World! 🌟</h1>
        <p>Bem-vindo ao projeto <span class="highlight">${project_name}</span></p>
        <p>Esta aplicação web foi criada com <span class="aws-logo">Amazon Q</span></p>
        <p>🚀 Infraestrutura como Código com Terraform</p>
        <p>☁️ Hospedado na AWS</p>
        <p>🔒 Acesso seguro via SSM</p>
        <div class="footer">
            <p>Projeto criado automaticamente pelo Amazon Q</p>
            <p>Data de criação: $(date)</p>
        </div>
    </div>
</body>
</html>
EOF

# Definir permissões corretas
chown apache:apache /var/www/html/index.html
chmod 644 /var/www/html/index.html

# Reiniciar Apache para garantir que tudo está funcionando
systemctl restart httpd

# Log de conclusão
echo "$(date): Servidor web configurado com sucesso!" >> /var/log/user-data.log
