*[Read in English](README.md)*

# Cloche OS

**Imagem de desktop pessoal imutável baseada no Fedora Atomic.**

O Cloche é uma imagem OCI customizada construída usando o framework BlueBuild. Ele foi projetado para ser um "daily driver" confiável que segue um modelo de configuração declarativa, permitindo um ambiente de trabalho estável, reprodutível e com deploys rápidos.

## Arquitetura Técnica

  - **Base:** Fedora / Universal Blue (ublue-os).

  - **Atômico/Imutável:** rpm-ostree para atualizações atômicas e rollbacks.

  - **Sistema de Build:** GitHub Actions para automação de camadas de imagem.

  - **Configuração:** Gerenciado via receitas YAML, definindo pacotes do sistema, flatpaks e scripts customizados.

## Principais Recursos

  - **Setup Declarativo:** Todo o estado do sistema é definido neste repositório.

  - **Integração CI/CD:** Builds automatizados disparados por alterações na configuração.

  - **Gerenciamento Híbrido de Pacotes:** Camadas centrais do sistema via rpm-ostree e sandboxing de aplicações via Flatpak.

  - **Padrões Otimizados:** Ferramentas pré-configuradas para gerenciamento de infraestrutura e desenvolvimento.

  - **Batteries included:** Como é o padrão das imagens ublue.

  - **Workflows Conteinerizados:** Inclui Distrobox e Docker out-of-the-box.

## Imagens Disponíveis

Este projeto mantém múltiplas variações de imagem para suportar diferentes configurações de hardware e ambientes de desktop (KDE Plasma e GNOME).

| Nome da Imagem | Ambiente Desktop | Alvo / Caso de Uso |
| :--- | :--- | :--- |
| **cloche-standard** | KDE Plasma | Workstation de uso geral |
| **cloche-standard-gnome** | GNOME | Workstation de uso geral |
| **cloche-xe** | KDE Plasma | Workstation / Foco em Performance e Gaming |
| **cloche-xe-gnome** | GNOME | Workstation / Foco em Performance e Gaming |
| **cloche-xe-deck** | KDE Plasma | Otimizado para Steam Deck |
| **cloche-xe-deck-gnome** | GNOME | Otimizado para Steam Deck |

## Modelo de Branch

- **main/latest**: Builds estáveis, testados e prontos para uso diário.

- **beta/testing**: Branch de testes para novas versões upstream, recursos experimentais e receitas em teste.

## Instalação

### CUIDADO!

***Esta é uma configuração pessoal. Faça o rebase por sua conta e risco.***

Para fazer o rebase de uma instalação Fedora Atomic existente para o Cloche, substitua `<IMAGE_NAME>` pela sua imagem preferida da tabela acima, e `<TAG>` por `latest` (main) ou `testing` (beta).

Rebase para o registry não verificado:

~~~bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/augustofmarques/<IMAGE_NAME>:<TAG>
~~~

Exemplo para a imagem KDE Standard na branch estável:

~~~bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/augustofmarques/cloche-standard:latest
~~~

Reinicie para aplicar as alterações:
~~~bash
systemctl reboot
~~~ 

**Opcional:** Verificar e fazer rebase para a imagem assinada:
Uma vez que a chave pública esteja configurada, você pode mudar para a imagem assinada para maior segurança.

## Geração Local de ISO

Você também pode gerar uma ISO bootável localmente usando a CLI do `bluebuild`. 

Execute o comando a seguir, substituindo o nome de saída e a imagem/tag alvo:

~~~bash
sudo bluebuild generate-iso --iso-name <OUTPUT_NAME>.iso image ghcr.io/augustofmarques/<IMAGE_NAME>:<TAG>
~~~

**Exemplo:** Gerando uma ISO para a imagem GNOME Steam Deck na branch beta:
~~~bash
sudo bluebuild generate-iso --iso-name cloche-deck-gnome.iso image ghcr.io/augustofmarques/cloche-xe-deck-gnome:testing
~~~

> ***Nota:*** Verifique a seção de pacotes (packages) deste repositório para encontrar os nomes e tags das imagens para cada branch (como a beta).<br>
Se os comandos de build de imagens ou ISOs forem executados sem a definição de tag, o comando utilizará por padrão a imagem mais recente (latest) da branch main.

## Objetivo do Projeto

O propósito do Cloche é eliminar as etapas manuais de pós-instalação. Ao tratar a estação de trabalho como um ativo imutável, garanto que meu ambiente seja consistente em diferentes máquinas e fácil de recuperar rapidamente em caso de falha de hardware.

## Aviso

Este é um projeto pessoal desenvolvido para fins educacionais e de hobby. Embora eu o utilize como meu sistema principal diário, ele é fornecido "como está" (as-is), sem quaisquer garantias. Use por sua conta e risco.