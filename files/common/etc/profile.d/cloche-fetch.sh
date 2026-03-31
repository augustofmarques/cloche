if [ -n "${DISTROBOX_ENTER_PATH:-}" ] || [ -f /run/.containerenv ]; then
    # container
    unalias fastfetch 2>/dev/null
else
    # host
    alias fastfetch="fastfetch -c /etc/fastfetch/config.jsonc"
fi
