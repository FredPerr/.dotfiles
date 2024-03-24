export VISUAL='nvim'
export JAVA_HOME="/home/fredperr/Unity/Hub/Editor/2023.3.0b6/Editor/Data/PlaybackEngines/AndroidPlayer/OpenJDK"
export ANDROID_HOME="/home/fredperr/Unity/Hub/Editor/2023.3.0b6/Editor/Data/PlaybackEngines/AndroidPlayer/SDK"
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/6.0/bin
# . "$HOME/.cargo/env" for Rust


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# pnpm
export PNPM_HOME="/home/fredperr/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/fredperr/.bun/_bun" ] && source "/home/fredperr/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Local and remote default editor
export EDITOR='nvim'
