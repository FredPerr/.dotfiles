export VISUAL='nvim'
export EDITOR='code'

# PNPM
export PNPM_HOME="/Users/fredperr/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Go
export GOPATH="$HOME/go/"
export GOBIN="$HOME/go/bin/"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"


# Granted alias (AWS)
alias assume=". assume"
