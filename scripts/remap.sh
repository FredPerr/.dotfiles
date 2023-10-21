
# If the script is run with sudo, it does not work.
if  [ "$EUID" -eq 0 ]; then
    sudo -u $SUDO_USER xmodmap -e 'clear lock'
    sudo -u $SUDO_USER xmodmap -e 'keycode 66 = Escape NoSymbol Escape'
else
    xmodmap -e 'clear lock'
    xmodmap -e 'keycode 66 = Escape NoSymbol Escape'
fi
