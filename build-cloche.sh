#!/bin/bash

# --- Setup ---
GITHUB_USER="augustofmarques"

TAG="latest"


IMAGES=("cloche-standard" "cloche-xe-deck" "cloche-xe")

echo "=========================================="
echo "          CLOCHE ISO GENERATOR            "
echo "=========================================="
echo "Usuário: $GITHUB_USER"
echo "Tag: $TAG"
echo "------------------------------------------"

# Verifies if BlueBuild is installed
if ! command -v bluebuild &> /dev/null; then
    echo "❌ Error:'bluebuild' command not found."
    echo "Install with: pip install bluebuild (or package manager)"
    exit 1
fi

# Select menu
echo "Choose ISO?"
echo "1) Cloche Standard"
echo "2) Cloche Xe Deck"
echo "3) Cloche Xe"
echo "4) All"
read -p "Choose [1-4]: " OPTION

case $OPTION in
    1)
        TARGETS=("cloche-standard")
        ;;
    2)
        TARGETS=("cloche-xe-deck")
        ;;
    3)
        TARGETS=("cloche-xe")
        ;;
    4)
        TARGETS=("cloche-standard" "cloche-xe-deck" "cloche-xe")
        ;;
    *)
        echo "Option invalid."
        exit 1
        ;;
esac

# Image generation loop
for IMAGE_NAME in "${TARGETS[@]}"; do
    echo ""
    echo "💿 Generating ISO: $IMAGE_NAME..."

    # Monta o comando
    # --no-sign: used to avoid issues with conflicting keys.
    # Image inside the ISO is already signed by GitHub, so it's safe.
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
