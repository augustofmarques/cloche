#!/bin/bash

# Define qual imagem usar
IMAGE="ghcr.io/augustofmarques/gnx-server:latest"

echo "🧹 Limpando builds antigos..."
rm -rf build
mkdir -p build

echo "⬇️ Baixando a versão mais recente do GitHub..."
# Força o podman a baixar a imagem nova (do Alma 9)
sudo podman pull $IMAGE

echo "💿 Iniciando o Bootc Image Builder..."
# O comando blindado
sudo podman run \
    --rm \
    -it \
    --privileged \
    --network host \
    --pull=newer \
    --security-opt label=type:unconfined_t \
    -v $(pwd)/build:/output \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    quay.io/centos-bootc/bootc-image-builder:latest \
    --type anaconda-iso \
    $IMAGE

echo "✅ Verifique a pasta 'build'!"
ls -lh build/
