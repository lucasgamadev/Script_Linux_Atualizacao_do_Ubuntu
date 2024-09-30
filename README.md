# Projeto Script Linux (Ubuntu)

## Modo de Uso (instalador online)

_Passo 1:_ Coloque o arquivo setup-atualizar-ubuntu.sh em uma pasta local do Ubuntu. Exemplo: Área de Trabalho.  
_Passo 2:_ Abra o terminal no local que está o arquivo.  
_Passo 3:_ Execute o seguinte comando:  

    sudo chmod +x setup-atualizar-ubuntu.sh && ./setup-atualizar-ubuntu.sh
  
_Passo 4:_ Aguarde o processo de download e instalação autônoma.  
_Passo 5:_ Faça a última instrução exibida ao final da instalação.  

_INSTRUÇÕES FINAIS:_ O atalho atualizar.desktop deve aparecer na sua área de trabalho agora.  
_Ubuntu 20.04 ou superior:_ Clique com o botão direito do mouse no atalho e selecione _"Permitir iniciar"_.
_Ubuntu 18.04 ou inferior:_ Clique com o botão direito do mouse no atalho e selecione _"Propriedades"_, selecione a aba _"Permissões"_ e marque a opção _"Permitir execução do arquivo como um programa"_. Agora você pode clicar duas vezes no atalho da área de trabalho e selecionar _"Confiar e iniciar"_.

Fim!

## O que o script setup-atualizar-ubuntu.sh faz?

Baixa os arquivos necessários via método wget, diretamente do Google Drive, e instala na pasta do usuário local, além de criar um atalho do script _atualizar-ubuntu.sh_ diretamente na Área de Trabalho.

## O que o script atualizar-ubuntu.sh faz?

É um script de automação para atualizar pacotes e o sistema operacional em uma distribuição Ubuntu. Ele realiza uma série de ações para garantir que o sistema esteja atualizado, removendo pacotes desnecessários, limpando arquivos temporários e atualizando pacotes tanto do sistema quanto da Snap Store.  
