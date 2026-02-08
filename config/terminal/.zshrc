# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
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

source ~/.dotfiles/config/aliases.sh &> /dev/null

bindkey -v

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# Update tmux window title to current directory name
set_tmux_title() {
  if [ -n "$TMUX" ]; then
    # Use ${PWD##*/} to get only the folder name, not the full path
    tmux rename-window "${PWD##*/}"
  fi
}

# Run the function every time the directory changes
autoload -Uz add-zsh-hook
add-zsh-hook chpwd set_tmux_title

# Set initial title on startup
set_tmux_title