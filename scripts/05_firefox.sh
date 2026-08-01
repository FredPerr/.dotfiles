#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"

source "$SCRIPT_DIR/utils.sh"

FIREFOX_APP="/Applications/Firefox.app"
FIREFOX_DIST="$FIREFOX_APP/Contents/Resources/distribution"
FIREFOX_PROFILES_DIR="$HOME/Library/Application Support/Firefox/Profiles"

info "Configuring Firefox..."

# --- policies.json (app-level, requires copy) ---------------------------
if [[ -d "$FIREFOX_APP" ]]; then
  sudo mkdir -p "$FIREFOX_DIST"
  sudo cp "$CONFIG_DIR/firefox/policies.json" "$FIREFOX_DIST/policies.json"
  success "policies.json installed at $FIREFOX_DIST"
else
  error "Firefox.app not found — skipping policies.json"
fi

# --- user.js (profile-level, symlink) -----------------------------------
if [[ -d "$FIREFOX_PROFILES_DIR" ]]; then
  PROFILE_DIR=$(find "$FIREFOX_PROFILES_DIR" -maxdepth 1 -name "*.default-release" | head -n 1)
  [[ -z "$PROFILE_DIR" ]] && PROFILE_DIR=$(find "$FIREFOX_PROFILES_DIR" -maxdepth 1 -name "*.default*" | head -n 1)

  if [[ -n "$PROFILE_DIR" ]]; then
    ln -sf "$CONFIG_DIR/firefox/user.js" "$PROFILE_DIR/user.js"
    success "user.js linked into $PROFILE_DIR"
  else
    error "No Firefox profile found — skipping user.js"
  fi
else
  error "Firefox Profiles directory not found — skipping user.js"
fi

success "Firefox configuration done!"
