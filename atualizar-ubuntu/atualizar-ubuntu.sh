#!/bin/bash
# Versão: 3.0.0

# Solicita a senha do usuário para executar comandos com sudo
sudo -v

# Ajusta o tamanho da janela do terminal (valor 2 = linhas | valor 3 = colunas)
printf "\e[8;40;100t"

# Definir as cores para o texto
preto=$(tput setaf 0) vermelho=$(tput setaf 1) verde=$(tput setaf 2) amarelo=$(tput setaf 3) azul=$(tput setaf 4) magenta=$(tput setaf 5) ciano=$(tput setaf 6) branco=$(tput setaf 7) cinza=$(tput setaf 8) roxo=$(tput setaf 129) laranja=$(tput setaf 166) bg_preto=$(tput setab 0) bg_branco=$(tput setab 7) negrito=$(tput bold) sublinhado=$(tput smul) reset=$(tput sgr0)

##################### ATUALIZAÇÃO DE PACOTES #####################

echo -e "${negrito}${ciano}Atualizando lista de pacotes...${reset}"
if ! sudo apt-get update | sudo tee /tmp/update.log; then
    echo -e "${negrito}${vermelho}Erro ao atualizar a lista de pacotes.${reset}"
    exit 1
fi

echo -e "${negrito}${ciano}Atualizando pacotes instalados...${reset}"
if ! sudo apt-get upgrade -y | sudo tee /tmp/upgrade.log; then
    echo -e "${negrito}${vermelho}Erro ao atualizar pacotes instalados.${reset}"
    exit 1
fi

##################### ATUALIZAÇÃO DA DISTRO #####################

echo -e "${negrito}${ciano}Atualizando distribuição...${reset}"
if ! sudo apt-get dist-upgrade -y | sudo tee /tmp/dist-upgrade.log; then
    echo -e "${negrito}${vermelho}Erro ao atualizar a distribuição.${reset}"
    exit 1
fi

# Busca por uma versão mais recente da distribuição
if ! sudo do-release-upgrade | sudo tee /tmp/do-release-upgrade.log; then
    echo -e "${negrito}${vermelho}Erro ao atualizar a distribuição.${reset}"
    exit 1
fi

echo -e "${negrito}${ciano}Removendo pacotes desnecessários...${reset}"
if ! sudo apt-get autoremove -y | sudo tee /tmp/autoremove.log; then
    echo -e "${negrito}${vermelho}Erro ao remover pacotes desnecessários.${reset}"
    exit 1
fi

echo -e "${negrito}${ciano}Limpando arquivos temporários...${reset}"
if ! sudo apt-get clean | sudo tee /tmp/clean.log; then
    echo -e "${negrito}${vermelho}Erro ao limpar arquivos temporários.${reset}"
    exit 1
fi

##################### ATUALIZAÇÃO PACOTES SNAP STORE #####################
# Melhoria 1: Verificar se o APP Snap Store está rodando, se estiver, finalizar o processo para poder atualizar o aplicativo, pois ele não atualiza em execução.

# Verificar se o Snap Store está em execução
process_name="snap-store"

if pgrep -x "$process_name" >/dev/null; then
    echo "${negrito}${amarelo}Snap Store está em execução.${reset}"

    # Obtém o número do processo da Snap Store
    process_id=$(pgrep -x "$process_name")
    echo "${negrito}${verde}O número do processo da Snap Store é:${reset}${magenta} $process_id${reset}"

    # Finaliza o processo da Snap Store
    echo "${negrito}${ciano}Finalizando o processo da Snap Store...${reset}"
    kill "$process_id"
    echo "${negrito}${verde}Processo da Snap Store finalizado.${reset}"
else
    echo "${negrito}${verde}Snap Store não está em execução.${reset}"
fi

# Atualização de pacotes snap
echo "${negrito}${ciano}Atualizando pacotes snap...${reset}"
sudo snap refresh
echo "${negrito}${verde}Pacotes atualizados!${reset}"

##################### RESULTADO #####################

# Mostra o resultado da atualização
echo -e "\n${negrito}${verde}Resultado da atualização:${reset}"
cat /tmp/upgrade.log

echo -e "${negrito}${verde}Atualização concluída com sucesso!${reset}"

read -p "${negrito}Pressione ${reset}${negrito}${verde}Enter${reset}${negrito} para fechar...${reset}"