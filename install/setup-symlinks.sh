
if  [ ! "$EUID" -eq 0 ]; then
    echo "You have to run this script with sudo!"
    exit 1
fi
HOME="/home/${SUDO_USER}"

ln -sf $HOME/.dotfiles/config/.bashrc $HOME/.bashrc
ln -sf $HOME/.dotfiles/config/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/config/.zsh_functions $HOME/.zsh_functions
ln -sf $HOME/.dotfiles/config/.zshenv $HOME/.zshenv
ln -sf $HOME/.dotfiles/assets/.fonts $HOME/.fonts

#
# Inside $HOME/.config/ folder
#

ln -sf $HOME/.dotfiles/config/alacritty $HOME/.config/alacritty
ln -sf $HOME/.dotfiles/config/autostart $HOME/.config/autostart
ln -sf $HOME/.dotfiles/config/i3 $HOME/.config/i3
ln -sf $HOME/.dotfiles/config/nvim $HOME/.config/nvim
ln -sf $HOME/.dotfiles/config/picom $HOME/.config/picom
ln -sf $HOME/.dotfiles/config/tmux $HOME/.config/tmux
ln -sf $HOME/.dotfiles/config/autorandr $HOME/.config/autorandr
ln -sf $HOME/.dotfiles/config/monitors.xml $HOME/.config/monitors.xml

echo "Setup symlinks successfully!"
