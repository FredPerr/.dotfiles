#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

info "Setting up Zsh..."

# --- Oh My Zsh --------------------------------------------------------------
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  success "Oh My Zsh is already installed."
else
  info "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  success "Oh My Zsh installed."
fi

# --- Set Zsh as default shell ------------------------------------------------
ZSH_PATH="$(which zsh)"
if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  info "Setting Zsh as default shell..."
  if ! grep -qF "$ZSH_PATH" /etc/shells; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells > /dev/null
  fi
  chsh -s "$ZSH_PATH"
  success "Default shell set to $ZSH_PATH"
else
  success "Zsh is already the default shell."
fi
