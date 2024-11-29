#!/bin/bash

# Atualizando os pacotes e instalando dependências básicas
echo "Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando dependências essenciais..."
sudo apt install -y python3 python3-pip python3-venv postgresql postgresql-contrib libpq-dev git

# Configurando PostgreSQL
echo "Configurando o banco de dados PostgreSQL..."
sudo -u postgres psql <<EOF
CREATE DATABASE wgerdb;
CREATE USER wgeruser WITH ENCRYPTED PASSWORD 'mypassword';
GRANT ALL PRIVILEGES ON DATABASE wgerdb TO wgeruser;
EOF

# Criando ambiente virtual para Python
echo "Criando ambiente virtual para o wger..."
python3 -m venv wger-env
source wger-env/bin/activate

# Instalando o wger
echo "Instalando o wger..."
pip install --upgrade pip
pip install wger

# Criando o arquivo de configuração do wger
echo "Criando arquivo de configuração para o wger..."
sudo mkdir -p /etc/wger
sudo bash -c 'cat > /etc/wger/wgerconfig.py <<EOF
DEBUG = False

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": "wgerdb",
        "USER": "wgeruser",
        "PASSWORD": "mypassword",
        "HOST": "localhost",
        "PORT": "5432",
    }
}

ALLOWED_HOSTS = ["localhost", "127.0.0.1"]
SECRET_KEY = "your-very-secret-key"
EOF'

# Ajustando permissões do arquivo de configuração
sudo chmod 600 /etc/wger/wgerconfig.py

# Inicializando o banco de dados para o wger
echo "Migrando o banco de dados do wger..."
cd wger-env/lib/python3.*/site-packages/wger
python manage.py makemigrations
python manage.py migrate

# Configurando um superusuário para o wger
echo "Criando superusuário para o wger..."
python manage.py createsuperuser

# Servindo a aplicação localmente
echo "Instalação concluída! Você pode rodar o servidor do wger com o seguinte comando:"
echo "source wger-env/bin/activate && python manage.py runserver 0.0.0.0:8000"
