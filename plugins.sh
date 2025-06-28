#!/bin/bash
echo "$SCRIPT_DIR"
cd "$SCRIPT_DIR/server/plugins/"
echo "Principais plugins"
echo "Se quer baixar um plugin que nao esta na lista, responda 0"
echo
echo "1 - EssentialsX"
echo "2 - LuckPerms"
echo "3 - ViaVersion"
echo "4 - WorldEdit"
echo "5 - CoreProtect"
echo "6 - ClearLagg"
echo "7 - Chunky"
echo "8 - Let Me Despawn"
echo "9 - Minepacks"
echo "10 - PlayerKits 2"
echo "11 - WorldGuard"
echo "12 - Orebfuscator"
echo "13 - DecentHolograms"
echo "14 - FancyHolograms"
echo "15 - invSee++"
echo "16 - Simple Voice Chat"
read plugin
if [[ "$plugin" = "0" ]]; then
  echo "Coloque aqui o caminho do arquivo java do plugin, assim ele sera instalado automaticamente"
  read caminho
  mv "$caminho" "$SCRIPT_DIR/server/plugins/"
elif [[ "$plugin" = "1" ]]; then
  wget -O EssentialsX.jar https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/Essentials/target/EssentialsX-2.21.0.jar
elif [[ "$plugin" = "2" ]]; then
  wget -O LuckPerms.jar https://download.luckperms.net/1526/bukkit/loader/LuckPerms-Bukkit-5.4.114.jar
elif [[ "$plugin" = "3" ]]; then
  wget -O ViaVersion.jar https://cdn.modrinth.com/data/P1dW8noP/versions/4.10.1/ViaVersion-4.10.1.jar
elif [[ "$plugin" = "4" ]]; then
  wget -O WorldEdit.jar https://dev.bukkit.org/projects/worldedit/files/5233030/download
elif [[ "$plugin" = "5" ]]; then
  wget -O CoreProtect.jar https://cdn.modrinth.com/data/1e5gVxJd/versions/22.3/CoreProtect-22.3.jar
elif [[ "$plugin" = "6" ]]; then
  wget -O ClearLagg.jar https://dev.bukkit.org/projects/clearlagg/files/5233031/download
elif [[ "$plugin" = "7" ]]; then
  wget -O Chunky.jar https://cdn.modrinth.com/data/fALzjamp/versions/1.5.4/Chunky-1.5.4.jar
elif [[ "$plugin" = "8" ]]; then
  wget -O LetMeDespawn.jar https://cdn.modrinth.com/data/Qb6mmK2r/versions/1.3.0/LetMeDespawn-1.3.0.jar
elif [[ "$plugin" = "9" ]]; then
  wget -O Minepacks.jar https://cdn.modrinth.com/data/6Dx5m4Hn/versions/3.1.1/Minepacks-3.1.1.jar
elif [[ "$plugin" = "10" ]]; then
  wget -O PlayerKits2.jar https://dev.bukkit.org/projects/playerkits/files/5233032/download
elif [[ "$plugin" = "11" ]]; then
  wget -O WorldGuard.jar https://dev.bukkit.org/projects/worldguard/files/5233033/download
elif [[ "$plugin" = "12" ]]; then
  wget -O Orebfuscator.jar https://cdn.modrinth.com/data/1e5gVxJd/versions/7.3.0/Orebfuscator-7.3.0.jar
elif [[ "$plugin" = "13" ]]; then
  wget -O DecentHolograms.jar https://cdn.modrinth.com/data/1e5gVxJd/versions/2.8.5/DecentHolograms-2.8.5.jar
elif [[ "$plugin" = "14" ]]; then
  wget -O FancyHolograms.jar https://cdn.modrinth.com/data/1e5gVxJd/versions/1.2.0/FancyHolograms-1.2.0.jar
elif [[ "$plugin" = "15" ]]; then
  wget -O InvSee++.jar https://cdn.modrinth.com/data/1e5gVxJd/versions/1.3.0/InvSee%2B%2B-1.3.0.jar
elif [[ "$plugin" = "16" ]]; then
  wget -O SimpleVoiceChat.jar https://cdn.modrinth.com/data/1e5gVxJd/versions/2.5.0/SimpleVoiceChat-2.5.0.jar
else
  echo "Opção inválida! Digite um número de 1 a 16."
  exit
fi
