#!/bin/bash

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

# Make all .sh files in the scripts folder executable
chmod +x "$(dirname "$0")"/*.sh

# Gray out the output of enable-key-repeating.sh
./setup/scripts/enable-key-repeating.sh | while IFS= read -r line; do
    echo -e "${GRAY}${line}${NC}"
done

./setup/scripts/show-hidden-files.sh | while IFS= read -r line; do
    echo -e "${GRAY}${line}${NC}"
done

# Check if Homebrew is already installed
if command -v brew &> /dev/null
then
    echo -e "${GREEN}Homebrew is already installed.${NC}"
else
    # Install Homebrew
    echo -e "${YELLOW}Homebrew not found. Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
    git \
    neovim \
    python3 \
    node \
    nvm \
    npm \
    pnpm \
    yarn \
    volta \
    go \
    rustup-init \
    ripgrep \
    fd \
    fzf \
    wget \
    zsh \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    docker \
    openssl \
    watchman \

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install --cask \ 
    visual-studio-code \
    android-platform-tools \
    gitkraken \
    alacritty \
    tmux \

brew install --cask \
    google-chrome \
    firefox \
    bruno \

# Install AWS specific tools
brew tap aws/tap
brew install --cask awscli aws-sam-cli aws-google-auth