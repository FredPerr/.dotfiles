#!/usr/bin/env bash

# Stop immediately if any step fails
set -e

# Resolve paths relative to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BREWFILE_PATH="$DOTFILES_DIR/Brewfile"

source "$SCRIPT_DIR/utils.sh"

# ------------------------------------------------------------------------------
# 1. Install / Verify Homebrew
# ------------------------------------------------------------------------------
info "Checking Homebrew installation..."

if command -v brew &> /dev/null; then
  success "Homebrew is already installed."
else
  info "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Initialize brew in current shell process (specifically for Apple Silicon Macs)
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  success "Homebrew installed successfully."
fi

# ------------------------------------------------------------------------------
# 2. Process Brewfile
# ------------------------------------------------------------------------------
if [[ -f "$BREWFILE_PATH" ]]; then
  info "Installing dependencies from Brewfile..."
  brew bundle --file="$BREWFILE_PATH"
  success "Brewfile dependencies installed!"
else
  error "No Brewfile found at $BREWFILE_PATH. Skipping bundle installation."
fi