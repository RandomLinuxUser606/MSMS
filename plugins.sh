#!/bin/bash
# Ler pasta
# Variavel da pasta
PASTA_DO_SCRIPT="$(cd "$(dirname "$0")" && pwd)"
PLUGINS="$PASTA_DO_SCRIPT/server/plugins"

echo "Coloque aqui o caminho do arquivo java do plugin, assim ele sera instalado automaticamente"
read caminho
#Adicionar o mv
mv "$caminho" "$PLUGINS"
