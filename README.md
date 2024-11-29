# wger-installer
Script de instalação automatizada para o wger em sistemas Ubuntu

# Wger Installer
Este repositório contém um script automatizado para instalar e configurar o wger, um sistema de gerenciamento de exercícios, em servidores Ubuntu.

# Descrição
O script realiza as seguintes tarefas:

Instala dependências necessárias.
Configura o banco de dados PostgreSQL.
Cria um ambiente virtual Python para isolamento.
Instala o wger e aplica as migrações do banco de dados.
Configura um superusuário para o sistema.
___________________________________________________________________________________________________________________________________________________________________________________________
# Requisitos
Antes de começar, certifique-se de que:

Você está utilizando uma versão do Ubuntu compatível (20.04 ou superior é recomendada).
Tem privilégios de root ou acesso sudo ao sistema.
___________________________________________________________________________________________________________________________________________________________________________________________

# Instalação
1. Baixe e execute o instalador
Para instalar e configurar o wger automaticamente, execute o comando abaixo no terminal:

Usando wget:
bash -c "$(wget -qLO - https://raw.githubusercontent.com/<seu-usuario>/wger-installer/main/install_wger.sh)"

Usando curl:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/<seu-usuario>/wger-installer/main/install_wger.sh)"

Nota: Substitua <seu-usuario> pelo nome de usuário do seu GitHub.

O que será instalado
Dependências:
Python 3 e pip
PostgreSQL e suas bibliotecas
Virtualenv para gerenciamento de ambientes Python
Banco de Dados:
Um banco de dados PostgreSQL chamado wgerdb será criado.
Um usuário PostgreSQL chamado wgeruser com senha mypassword será configurado.
Arquivo de Configuração:
Um arquivo de configuração (/etc/wger/wgerconfig.py) será criado com as configurações necessárias.

Como Acessar o Wger
Após a instalação, ative o ambiente virtual:

source wger-env/bin/activate
Navegue até o diretório do wger:

cd wger-env/lib/python3.*/site-packages/wger
Inicie o servidor Django:

python manage.py runserver 0.0.0.0:8000
Acesse o wger no navegador em:
http://localhost:8000

Criação de Superusuário
Durante a instalação, você será solicitado a criar um superusuário. Isso inclui:

Nome de usuário.
Endereço de e-mail.
Senha.
Use essas credenciais para acessar a interface administrativa do wger.

Personalizações
Se desejar modificar o comportamento do instalador:

Edite o script install_wger.sh antes de executá-lo.
Você pode ajustar:
O nome do banco de dados.
Usuário e senha do PostgreSQL.
Configurações de ALLOWED_HOSTS no Django.
Contribuições
Contribuições são bem-vindas! Para colaborar:

Faça um fork deste repositório.
Envie um pull request com suas alterações.
Se precisar de suporte, sinta-se à vontade para abrir uma issue ou entrar em contato. 😊
