#!/usr/bin/env bash

# Stop on first error
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$DOTFILES_DIR/scripts"

# Make sure sub-scripts are executable
chmod +x "$SCRIPTS_DIR"/*.sh

echo "=========================================="
echo " Starting dotfiles & System Setup "
echo "=========================================="

# 1. Install Homebrew
"$SCRIPTS_DIR/01_homebrew.sh"

# 2. Zsh & Oh My Zsh
"$SCRIPTS_DIR/02_zsh.sh"

# 3. Create Symlinks
"$SCRIPTS_DIR/03_symlinks.sh"

# 4. macOS Defaults
"$SCRIPTS_DIR/04_macos_defaults.sh"

# 5. Firefox
"$SCRIPTS_DIR/05_firefox.sh"

# 6. Editor Extensions (VS Code & Kiro)
"$SCRIPTS_DIR/06_ide_extensions.sh"

echo "=========================================="
echo " Setup Completed Successfully! "
echo "=========================================="