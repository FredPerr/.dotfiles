USER="${SUDO_USER:-$USER}"
XMODMAP_FILE="/home/${USER}/.dotfiles/config/.Xmodmap"

xmodmap $XMODMAP_FILE 2>/tmp/xmodmap.errors
