#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

info "Applying macOS defaults..."

# --- Finder -------------------------------------------------------------
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# --- Dock ---------------------------------------------------------------
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true

# --- Keyboard & Input ---------------------------------------------------
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# --- Trackpad & Mouse ---------------------------------------------------
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad KeyboardDimTime -int 300
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.5
defaults write NSGlobalDomain com.apple.mouse.scaling -float 2.5

# --- Screenshots --------------------------------------------------------
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true
mkdir -p "$HOME/Desktop/Screenshots"

# --- Dialogs ------------------------------------------------------------
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# --- Printing -----------------------------------------------------------
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# --- Mission Control ----------------------------------------------------
defaults write com.apple.dock mru-spaces -bool false

# --- Safari (dev) -------------------------------------------------------
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# --- Chrome -------------------------------------------------------------
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

# --- OrbStack -----------------------------------------------------------
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/OrbStack.app", hidden:true}' 2>/dev/null || true

# --- Restart affected apps ----------------------------------------------
info "Restarting affected applications..."
for app in "Finder" "Dock" "SystemUIServer"; do
  killall "$app" &> /dev/null || true
done

success "macOS defaults applied!"
