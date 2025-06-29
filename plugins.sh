#!/bin/bash
# Ler pasta
# Variavel da pasta
PASTA_DO_SCRIPT="$(cd "$(dirname "$0")" && pwd)"
PLUGINS="$PASTA_DO_SCRIPT/server/plugins"

echo "Enter the Java plugin file path here to install it automatically"
read caminho
#Adicionar o mv
mv "$caminho" "$PLUGINS"
