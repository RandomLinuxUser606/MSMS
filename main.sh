#!/bin/bash
# By RandomLinuxUser606

echo MSMS - Testing
echo A CLI and open-source CLI utility made to make it easier to create
echo and manage a Minecraft server.
echo
echo "###################################"
echo "Minecraft Server Made Simple (MSMS)"
echo "###################################"
echo "Options (1-4):"
echo "1 - Start server"
echo "2 - Create server"
echo "3 - Manage server"
echo "4 - Exit"
read resposta

if [ "$resposta" = '1' ]; then
  if [ -d "server" ]; then
    cd server
    echo 'Quanta RAM voce quer alocar para o servidor? (em GB)'
    read quanta
    java -jar -Xmx"$quanta"G server.jar nogui
  else
    echo "Erro: Pasta 'server' nao encontrada. Crie um servidor primeiro (opcao 2)."
  fi

elif [ "$resposta" = '2' ]; then
  clear
  echo Qual tipo de minecraft voce quer usar?
  echo
  echo "1 - Paper (plugin) (1.21.6)"
  echo "2 - Vanilla (1.21.6)"
  read versao

  if [[ "$versao" = '1' ]]; then
    mkdir -p server
    cd server
    wget https://fill-data.papermc.io/v1/objects/bfca155b4a6b45644bfc1766f4e02a83c736e45fcc060e8788c71d6e7b3d56f6/paper-1.21.6-46.jar
    mv paper-1.21.6-46.jar server.jar

    java -jar server.jar
    sed -i 's/eula=false/eula=true/g' eula.txt
    clear
    echo 'Quanta RAM voce quer alocar para o servidor? (em GB)'
    echo
    read ram
    java -jar -Xmx"$ram"G server.jar nogui

  elif [ "$versao" = '2' ]; then
    mkdir -p server
    cd server
    wget https://piston-data.mojang.com/v1/objects/6e64dcabba3c01a7271b4fa6bd898483b794c59b/server.jar
    java -jar server.jar
    sed -i 's/eula=false/eula=true/g' eula.txt
    clear
    echo 'Quanta RAM voce quer alocar para o servidor? (em GB)'
    echo
    read ram
    java -jar -Xmx"$ram"G server.jar nogui
  else
    echo "Escolha uma opcao valida"
  fi

elif [ "$resposta" = '3' ]; then
  if [ -d "server" ]; then
    cd server
    clear
    echo O que voce quer gerenciar?
    echo
    echo "1 - Nome"
    echo "2 - Chunks renderizadas"
    echo "3 - Chunks simuladas"
    echo "4 - Gerenciar plugins"
    read gerenciar

    if [ "$gerenciar" = '1' ]; then
      clear
      echo "Qual nome voce quer que o servidor tenha?"
      echo
      read nome
      sed -i "s/motd=.*/motd=$nome/" server.properties
      echo "Nome do servidor alterado para: $nome"

    elif [ "$gerenciar" = '2' ]; then
      clear
      echo "Quantas chunks voce quer que o servidor renderize para todos?"
      echo
      read render
      sed -i "s/view-distance=.*/view-distance=$render/" server.properties
      echo "Distancia de renderizacao alterada para $render"

    elif [ "$gerenciar" = '3' ]; then
      clear
      echo "Quantas chunks voce quer que o servidor simule?"
      echo
      read simula
      sed -i "s/simulation-distance=.*/simulation-distance=$simula/" server.properties
      echo "Distancia de simulacao alterada para $simula"

    elif [ "$gerenciar" = '4' ]; then
      clear
      echo O que voce gostaria de fazer?
      echo
      echo "1 - Instalar plugins"
      echo "2 - Remover plugins"
      read plugop

      if [ "$plugop" = '1' ]; then
        ./plugins.sh
      elif [ "$plugop" = '2' ]; then
        echo "Esses sao os plugins instalados, escreva o nome do arquivo .jar do plugin para deleta-lo."
        cd plugins
        ls
        read deletar
        rm "$deletar"
      else
        echo "Digite algo valido!"
      fi
    else
      echo "Opcao invalida!"
    fi
  else
    echo "Erro: Pasta 'server' nao encontrada. Crie um servidor primeiro (opcao 2)."
  fi

elif [ "$resposta" = '4' ]; then
  exit
else
  echo 'Por favor, responda algo de 1 a 4'
fi
