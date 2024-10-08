# Projeto Script Linux (Ubuntu)

## Modo de Uso (instalador online)

**Passo 1:** Coloque o arquivo **setup-atualizar-ubuntu.sh** em uma pasta local do Ubuntu. Exemplo: Área de Trabalho.  
**Passo 2:** Abra o terminal no local que está o arquivo.  
**Passo 3:** Execute o seguinte comando:  

    sudo chmod +x setup-atualizar-ubuntu.sh && ./setup-atualizar-ubuntu.sh
  
**Passo 4:** Aguarde o processo de download e instalação autônoma.  
**Passo 5:** Faça a última instrução exibida ao final da instalação.  

**INSTRUÇÕES FINAIS:** O atalho atualizar.desktop deve aparecer na sua área de trabalho agora.  
**Ubuntu 20.04 ou superior:** Clique com o botão direito do mouse no atalho e selecione **"Permitir iniciar"**.
**Ubuntu 18.04 ou inferior:** Clique com o botão direito do mouse no atalho e selecione **"Propriedades"**, selecione a aba **"Permissões"** e marque a opção **"Permitir execução do arquivo como um programa"**. Agora você pode clicar duas vezes no atalho da área de trabalho e selecionar **"Confiar e iniciar"**.

Fim!

## O que o script setup-atualizar-ubuntu.sh faz?

Baixa os arquivos necessários via método wget, diretamente do Google Drive, e instala na pasta do usuário local, além de criar um atalho do script **atualizar-ubuntu.sh** diretamente na Área de Trabalho.

## O que o script atualizar-ubuntu.sh faz?

É um script de automação para atualizar pacotes e o sistema operacional em uma distribuição Ubuntu. Ele realiza uma série de ações para garantir que o sistema esteja atualizado, removendo pacotes desnecessários, limpando arquivos temporários e atualizando pacotes tanto do sistema quanto da Snap Store.  
