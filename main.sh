#!/bin/bash
# Copyright (C) 2025 RandomLinuxUser606 <davizinedicao@protonmail.com>  
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, either version 3 of the License, or  
# any later version.  
#  
# This program is distributed in the hope that it will be useful,  
# but WITHOUT ANY WARRANTY; without even the implied warranty of  
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the  
# GNU General Public License for more details.  
#  
# You should have received a copy of the GNU General Public License  
# along with this program. If not, see <https://www.gnu.org/licenses/>.  
echo "MSMS - Version 0.1"
echo "A CLI and open-source utility to simplify creating"
echo "and managing a Minecraft server."
echo
echo "###################################"
echo "Minecraft Server Made Simple (MSMS)"
echo "###################################"
echo "Options (1-4):"
echo "1 - Start server"
echo "2 - Create server"
echo "3 - Manage server"
echo "4 - Computer usage"
echo "5 - Exit"
read resposta

if [ "$resposta" = '1' ]; then
  if [ -d "server" ]; then
    cd server
    echo 'How much RAM do you want to allocate to the server? (in GB)'
    read quanta
    java -jar -Xmx"$quanta"G server.jar nogui
  else
    echo "Error: 'server' folder not found. Create a server first (option 2)."
  fi

elif [ "$resposta" = '2' ]; then
  clear
  echo "Which Minecraft type do you want to use?"
  echo
  echo "1 - Paper (plugins) (1.21.6)"
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
    echo 'How much RAM do you want to allocate to the server? (in GB)'
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
    echo 'How much RAM do you want to allocate to the server? (in GB)'
    echo
    read ram
    java -jar -Xmx"$ram"G server.jar nogui
  else
    echo "Please choose a valid option."
  fi

elif [ "$resposta" = '3' ]; then
  if [ -d "server" ]; then
    clear
    echo "What do you want to manage?"
    echo
    echo "Name and icon"
    echo "1 - Server name"
    echo "2 - Server icon"
    echo "Performance & plugins"
    echo "3 - Rendered chunks"
    echo "4 - Simulated chunks"
    echo "5 - Manage plugins"
    echo "6 - Max player count"
    echo "Game mode"
    echo "7 - Change gamemode"
    # Criar, futuramente, "Change difficulty" e "Online mode (on/off)".
    read gerenciar

    if [ "$gerenciar" = '1' ]; then
      clear
      echo "What name do you want for the server?"
      echo
      read nome
      sed -i "s/motd=.*/motd=$nome/" server/server.properties
      echo "Server name changed to: $nome"
    elif [ "$gerenciar" = '2' ]; then
      clear
      echo "What is the path of the image? Do not use tilde expansion paths."
      echo "Note: The image must be 64x64 in size."
      read icone
      mv "$icone" server-icon.png
      mv server-icon.png server/

    elif [ "$gerenciar" = '3' ]; then
      clear
      echo "How many chunks should the server render for players?"
      echo
      read render
      sed -i "s/view-distance=.*/view-distance=$render/" server.properties
      echo "Render distance set to $render"

    elif [ "$gerenciar" = '4' ]; then
      clear
      echo "How many chunks should the server simulate?"
      echo
      read simula
      sed -i "s/simulation-distance=.*/simulation-distance=$simula/" server.properties
      echo "Simulation distance set to $simula"

    elif [ "$gerenciar" = '5' ]; then
      clear
      echo "What would you like to do?"
      echo
      echo "1 - Install plugins"
      echo "2 - Remove plugins"
      read plugop

      if [ "$plugop" = '1' ]; then
        PASTA_DO_SCRIPT="$(cd "$(dirname "$0")" && pwd)"
        PLUGINS="$PASTA_DO_SCRIPT/plugins"

        echo "Enter the Java plugin file path here to install it automatically"
        read caminho

        mv "$caminho" "$PLUGINS"
      elif [ "$plugop" = '2' ]; then
        echo "These are the installed plugins. Enter the .jar filename to delete it."
        cd plugins
        ls
        read deletar
        rm "$deletar"
      else
        echo "Please enter a valid option!"
      fi

    elif [ "$gerenciar" = '6' ]; then
      echo "What limit do you want?"
      read limite
      sed -i "s/max-players=.*/max-players=$limite/" server.properties
    elif [ "$gerenciar" = '7' ]; then
      echo "Which gamemode do you want?"
      echo
      echo "1 - Survival"
      echo "2 - Creative"
      read gamemode
      if [ "$gamemode" = '1' ]; then
        sed -i "s/gamemode=.*/gamemode=survival/" server/server.properties
      elif [ "$gamemode" = '2' ]; then
        sed -i "s/gamemode=.*/gamemode=creative/" server/server.properties
      else
        echo "Please enter a valid option!"
      fi
    else
      echo "Invalid option!"
    fi
  else
    echo "Error: 'server' folder not found. Create a server first (option 2)."
  fi

elif [ "$resposta" = '4' ]; then
  clear
  watch -n 1 '
  echo "CPU: $(mpstat 1 1 | awk '\''/Average:/ {print 100 - $NF "%"}'\'')"
  echo "RAM: $(free | awk '\''/Mem:/ {printf "%.1f%%", ($3/$2)*100}'\'')"
  echo "Temp. CPU:" sensors | grep "temp1" || sensors | grep "Core 0" || sensors | grep "package id 0" '
elif [ "$resposta" = '5' ]; then
  exit
fi
