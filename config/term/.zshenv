export VISUAL='nvim'
export EDITOR='nvim'

export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/6.0/bin


export PNPM_HOME="/Users/fred/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Go
export GOPATH="$HOME/go/"
export GOBIN="$HOME/go/bin/"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"