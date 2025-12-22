#!/bin/bash

# Set variables
CONFIG_DIR="$(pwd)/config"
VSCODE_SRC_DIR="$CONFIG_DIR/vscode"
VSCODE_DEST_DIR="$HOME/Library/Application Support/Code/User"
GITCONFIG_SRC="$CONFIG_DIR/.gitconfig"
GITCONFIG_DEST="$HOME/.gitconfig"
ALACRITTY_SRC_DIR="$CONFIG_DIR/alacritty"

# Create VSCode settings symlinks
mkdir -p "$VSCODE_DEST_DIR"
ln -sf "$VSCODE_SRC_DIR/settings.json" "$VSCODE_DEST_DIR/settings.json"
ln -sf "$VSCODE_SRC_DIR/keybindings.json" "$VSCODE_DEST_DIR/keybindings.json"
ln -sf "$VSCODE_SRC_DIR/tasks.json" "$VSCODE_DEST_DIR/tasks.json"

# Create Alacritty config symlink
mkdir -p "$HOME/.config/alacritty"
ln -sf "$ALACRITTY_SRC_DIR/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# Create Aerospace config symlink
mkdir -p "$HOME/.config/aerospace"
ln -sf "$CONFIG_DIR/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
ln -sf "$CONFIG_DIR/aerospace/floating-logic.sh" "$HOME/.config/aerospace/floating-logic.sh"
chmod +x "$HOME/.config/aerospace/floating-logic.sh"

# Symlink .gitconfig to home directory
ln -sf "$GITCONFIG_SRC" "$GITCONFIG_DEST"
ln -sf $CONFIG_DIR/terminal/.bashrc $HOME/.bashrc
ln -sf $CONFIG_DIR/terminal/.zshrc $HOME/.zshrc
ln -sf $CONFIG_DIR/terminal/.zsh_functions $HOME/.zsh_functions
ln -sf $CONFIG_DIR/terminal/.zshenv $HOME/.zshenv
ln -sf $CONFIG_DIR/tmux $HOME/.config/tmux