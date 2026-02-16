# Garante que a pasta existe no repo
mkdir -p files/common/etc/skel/

# Vamos criar um .bashrc padrão no repo que já tenha o alias
# (Se você já tiver um .bashrc lá, isso vai sobrescrever, mas como é novo, tudo bem)
cat <<EOF > files/common/etc/skel/.bashrc
# .bashrc do GNX

# Carrega as configurações globais
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# O Fix do GNX para forçar o Fastfetch correto
alias fastfetch='/usr/bin/fastfetch --config /etc/fastfetch/config.jsonc'
EOF
