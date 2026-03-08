#if command -v fastfetch &> /dev/null; then
#    fastfetch --config /etc/fastfetch/config.jsonc
#fi
# Set an alias so typing 'fastfetch' uses the Cloche config manually
# This will NOT run automatically on terminal startup
alias fastfetch='fastfetch --config /etc/fastfetch/config.jsonc'
