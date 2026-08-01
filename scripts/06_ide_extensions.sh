#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"

source "$SCRIPT_DIR/utils.sh"

install_extensions() {
  local cli="$1"
  local list_file="$2"

  if ! command -v "$cli" &> /dev/null; then
    error "$cli not found — skipping extensions."
    return
  fi

  if [[ ! -f "$list_file" ]]; then
    error "Extension list not found: $list_file"
    return
  fi

  info "Installing $cli extensions..."
  while IFS= read -r ext; do
    [[ -z "$ext" ]] && continue
    "$cli" --install-extension "$ext" --force &> /dev/null && \
      success "$ext" || \
      error "Failed: $ext"
  done < "$list_file"
}

install_extensions "code" "$CONFIG_DIR/vscode/extensions.txt"
install_extensions "kiro" "$CONFIG_DIR/kiro/extensions.txt"

success "Extensions done!"
