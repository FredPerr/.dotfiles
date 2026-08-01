#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"

source "$SCRIPT_DIR/utils.sh"

symlink() {
  local src="$1"
  local dest="$2"

  if [[ ! -e "$src" ]]; then
    error "Source not found: $src — skipping."
    return
  fi

  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
  success "Linked $dest → $src"
}

info "Creating symlinks..."

# --- Terminal -----------------------------------------------------------
symlink "$CONFIG_DIR/zsh/.zshrc" "$HOME/.zshrc"
symlink "$CONFIG_DIR/zsh/.zshenv" "$HOME/.zshenv"
symlink "$CONFIG_DIR/terminal/.aliases" "$HOME/.aliases"

# --- SSH ----------------------------------------------------------------
symlink "$CONFIG_DIR/ssh/config" "$HOME/.ssh/config"

# --- Git ----------------------------------------------------------------
symlink "$CONFIG_DIR/git/.gitconfig" "$HOME/.gitconfig"

# --- Alacritty ----------------------------------------------------------
symlink "$CONFIG_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# --- Aerospace ----------------------------------------------------------
symlink "$CONFIG_DIR/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
symlink "$CONFIG_DIR/aerospace/floating-logic.sh" "$HOME/.config/aerospace/floating-logic.sh"
chmod +x "$HOME/.config/aerospace/floating-logic.sh"

# --- VS Code ------------------------------------------------------------
VSCODE_DEST_DIR="$HOME/Library/Application Support/Code/User"
symlink "$CONFIG_DIR/vscode/settings.json" "$VSCODE_DEST_DIR/settings.json"
symlink "$CONFIG_DIR/vscode/keybindings.json" "$VSCODE_DEST_DIR/keybindings.json"

# --- Kiro ---------------------------------------------------------------
KIRO_DEST_DIR="$HOME/Library/Application Support/Kiro/User"
symlink "$CONFIG_DIR/kiro/settings.json" "$KIRO_DEST_DIR/settings.json"
symlink "$CONFIG_DIR/kiro/keybindings.json" "$KIRO_DEST_DIR/keybindings.json"

# --- Tmux ---------------------------------------------------------------
symlink "$CONFIG_DIR/tmux" "$HOME/.config/tmux"

success "Symlinks done!"
