if  [ ! "$EUID" -eq 0 ]; then
    echo "You have to run this script with sudo!"
    exit 1
fi
HOME="/home/${SUDO_USER}"

ln -sf ~/.dotfiles/config/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/config/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/config/.zsh_functions ~/.zsh_functions

sudo -u $SUDO_USER ln -sf ~/.dotfiles/config/.Xmodmap ~/.Xmodmap

ln -sf ~/.dotfiles/config/.gitconfig ~/.gitconfig

#
# Inside ~/.config/ folder
#

ln -sf ~/.dotfiles/config/alacritty ~/.config/alacritty
ln -sf ~/.dotfiles/config/autostart ~/.config/autostart
ln -sf ~/.dotfiles/config/i3 ~/.config/i3
ln -sf ~/.dotfiles/config/nvim ~/.config/nvim
ln -sf ~/.dotfiles/config/picom ~/.config/picom
ln -sf ~/.dotfiles/config/tmux ~/.config/tmux
ln -sf ~/.dotfiles/config/autorandr ~/.config/autorandr
ln -sf ~/.dotfiles/config/monitors.xml ~/.config/monitors.xml
ln -sf ~/.dotfiles/config/.zshenv ~/.zshenv

sudo ln -sf ~/.dotfiles/config/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf

echo "Setup symlinks successfully!"
