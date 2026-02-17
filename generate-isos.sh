#!/bin/bash

# --- CONFIGURAÇÃO ---
# Seu usuário do GitHub (tudo minúsculo geralmente)
GITHUB_USER="augustofmarques"
# Versão da imagem (latest é o padrão)
TAG="latest"

# Lista das suas imagens (nomes exatos do GHCR)
IMAGES=("gnx-workstation" "gnx-deck" "gnx-workstation-xe" "gnx-server")

# --- LÓGICA ---

echo "=========================================="
echo "            GNX ISO GENERATOR             "
echo "=========================================="
echo "Usuário: $GITHUB_USER"
echo "Tag: $TAG"
echo "------------------------------------------"

# Verifica se o BlueBuild está instalado
if ! command -v bluebuild &> /dev/null; then
    echo "❌ Error:'bluebuild' command not found."
    echo "Install with: pip install bluebuild (or package manager)"
    exit 1
fi

# Menu de Seleção
echo "Choose ISO?"
echo "1) GNX Workstation (Aurora)"
echo "2) GNX Deck (Bazzite-deck)"
echo "3) GNX Workstation XE (Bazzite)"
echo "4) GNX Server (Alma Linux)"
echo "5) All"
read -p "Choose [1-4]: " OPTION

case $OPTION in
    1)
        TARGETS=("gnx-workstation")
        ;;
    2)
        TARGETS=("gnx-deck")
        ;;
    3)
        TARGETS=("gnx-workstation-xe")
        ;;
    4)
        TARGETS=("gnx-server")
        ;;
    5)
        TARGETS=("gnx-workstation" "gnx-deck" "gnx-workstation-xe" "gnx-server")
        ;;
    *)
        echo "Option invalid."
        exit 1
        ;;
esac

# O Loop de Construção
for IMAGE_NAME in "${TARGETS[@]}"; do
    echo ""
    echo "💿 Generating ISO: $IMAGE_NAME..."

    # Monta o comando
    # --no-sign: Usamos isso localmente para evitar problemas de chave no seu PC.
    # A imagem DENTRO da ISO já vem assinada do GitHub, então é seguro.
    sudo bluebuild generate-iso \
        --iso-name "$IMAGE_NAME.iso" \
        image "ghcr.io/$GITHUB_USER/$IMAGE_NAME:$TAG" \
        #--no-sign

    if [ $? -eq 0 ]; then
        echo "✅ Sucess! ISO created: $IMAGE_NAME.iso"
    else
        echo "❌ Failed generating $IMAGE_NAME.iso"
    fi
done

echo ""
echo "🎉 Process finalized."
