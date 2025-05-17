# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git ssh-agent)

zstyle :omz:plugins:ssh-agent agent-forwarding yes

# Mac OS X
zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain

source $ZSH/oh-my-zsh.sh

fpath+=${ZDOTDIR:-~}/.zsh_functions

source ~/.dotfiles/scripts/aliases.sh &> /dev/null
source ~/.dotfiles/scripts/remap.sh &> /dev/null

bindkey -v

# pnpm
export PNPM_HOME="/Users/fred/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"


# Load Angular CLI autocompletion.
source <(ng completion script)
