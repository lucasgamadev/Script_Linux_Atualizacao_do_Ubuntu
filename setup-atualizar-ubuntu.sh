#!/bin/bash

# Solicita a senha do usuário para executar comandos com sudo
sudo -v

# Ajusta o tamanho da janela do terminal (valor 2 = linhas | valor 3 = colunas)
printf "\e[8;40;100t"

# Definir as cores para o texto
preto=$(tput setaf 0)
vermelho=$(tput setaf 1)
verde=$(tput setaf 2)
amarelo=$(tput setaf 3)
azul=$(tput setaf 4)
magenta=$(tput setaf 5)
ciano=$(tput setaf 6)
branco=$(tput setaf 7)
cinza=$(tput setaf 8)
roxo=$(tput setaf 129)
laranja=$(tput setaf 166)
bg_preto=$(tput setab 0)
bg_branco=$(tput setab 7)
negrito=$(tput bold)
sublinhado=$(tput smul) 
reset=$(tput sgr0)

# Função para verificar conexão com a internet
echo "${negrito}${ciano}Verificando conexão com a internet...${reset}"
if ping -c 1 -W 1 google.com &> /dev/null; then
    # Mostra mensagem de conexão estabelecida
        echo "${negrito}${verde}Conexão estabelecida!${reset}"
else
    # Mostra mensagem de sem conexão e fecha o script
    echo "${negrito}${vermelho}Sem conexão. Verifique sua rede e tente novamente.${reset}"
    read -p "${negrito}Pressione ${vermelho}Enter${reset}${negrito} para sair${reset}"
    exit 1
fi

# Cria pasta para os arquivos
ARQUIVO="atualizar-ubuntu" # < Coloque o nome do arquivo.zip aqui
LOCAL="/usr/local/bin/$ARQUIVO/"
echo "${negrito}${ciano}Criando pasta ${reset}${negrito}${magenta}$ARQUIVO${reset}${negrito}${ciano} em${reset} ${negrito}${magenta}/usr/local/bin${reset}${negrito}${ciano}...${reset}"
sudo mkdir "$LOCAL"
echo "${negrito}${verde}A pasta ${reset}${negrito}${magenta}$ARQUIVO${reset}${negrito}${verde} foi criada!${reset}"

# Abrir pasta
echo "${negrito}${ciano}Abrindo pasta ${reset}${negrito}${magenta}$LOCAL${reset}${negrito}${ciano}...${reset}"
cd "$LOCAL"

# Download do arquivo compactado (comando wget para arquivo maior que 100MB)
FILE_ID="17v8LBM0PLJkuEDq94GntDJ0Bp6qZkdYT" # < Coloque o ID do arquivo do Google Drive aqui
FILE_NAME="$ARQUIVO.zip"
echo "${negrito}${ciano}Iniciando download do arquivo compactado...${reset}"
sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id="$FILE_ID"' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id="$FILE_ID"" -O "$FILE_NAME" && rm -rf /tmp/cookies.txt
echo "${negrito}${verde}Download concluído com sucesso!${reset}"

# Descompactar arquivos
echo "${negrito}${ciano}Descompactando arquivos...${reset}"
sudo unzip "$FILE_NAME"
echo "${negrito}${verde}Os arquivos foram descompactados na pasta ${reset}${negrito}${magenta}$LOCAL${reset}"

# Remover arquivo compactado
echo "${negrito}${ciano}Removendo arquivo compactado (.zip)...${reset}"
sudo rm "$FILE_NAME"
echo "${negrito}${verde}O arquivo ${reset}${negrito}${azul}$ARQUIVO.zip ${reset}${negrito}${verde}foi removido!${reset}"

# Dar permissão para execução para arquivo .desktop e .sh
# Aplica permissão de execução (+x) para o proprietário, grupo e outros aos arquivos .sh.
sudo chmod +x *.desktop *.sh
# Aplica permissões de leitura e escrita para o proprietário, e apenas leitura para grupo e outros aos arquivos .desktop.
sudo chmod 644 *.desktop
echo "${negrito}${verde}Concedida a permissão de execução para os arquivos .desktop e .sh!${reset}"

# Alterar o proprietário do arquivo .desktop para o usuário atual
echo "${negrito}${ciano}Alterando o proprietário do arquivo .desktop para o usuário atual...${reset}"
sudo chown $USER:$USER *.desktop
echo "${negrito}${verde}O proprietário do arquivo .desktop foi alterado para ${magenta}$USER${reset}"

# Mover arquivo .desktop para Área de Trabalho
echo "${negrito}${ciano}Movendo arquivo .desktop...${reset}"
sudo mv -t ~/Área\ de\ Trabalho/ $LOCAL*.desktop
echo "${negrito}${verde}O arquivo .desktop foi movido para ${magenta}Área de Trabalho${reset}"

# Mensagem de conclusão de instalação
echo "${negrito}${verde}A instalação foi concluída com sucesso!${reset}"

# Instruções finais
echo "${negrito}${branco}O atalho deve aparecer na sua área de trabalho agora. Clique com o botão direito do mouse no atalho e selecione ${reset}${negrito}${verde}"Permitir iniciar"${reset}. ${negrito}${branco}Agora você pode clicar duas vezes no atalho para executar o script diretamente da sua área de trabalho.${reset}"

# Esperar pelo Enter para sair
read -p "${negrito}Pressione ${verde}Enter${reset}${negrito} para sair${reset}"