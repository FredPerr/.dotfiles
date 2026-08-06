export VISUAL='kiro'
export EDITOR='nvim'

# PATH setup
typeset -U path
path=(
  /opt/homebrew/opt/libpq/bin
  /Library/TeX/texbin
  $path
)

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Go
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"

# Cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

alias assume=". assume"
