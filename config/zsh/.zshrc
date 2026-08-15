# ==============================================================================
# GUARD: Prevent double-sourcing (Kiro/VSCode injection sources .zshrc again)
# ==============================================================================
[[ -n "$__ZSHRC_LOADED" ]] && return
__ZSHRC_LOADED=1

# ==============================================================================
# OH MY ZSH CONFIGURATION
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX="true"

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${HOST}-${ZSH_VERSION}"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ==============================================================================
# SHELL OPTIONS & ALIASES
# ==============================================================================
fpath+=${ZDOTDIR:-~}/.zsh_functions
bindkey -v

source ~/.aliases &> /dev/null

# ==============================================================================
# CLI TOOLS & SHELL INTEGRATIONS
# ==============================================================================

# Mise (cached activation for faster startup)
if command -v mise &> /dev/null; then
  _mise_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/mise-activate.zsh"
  if [[ ! -f "$_mise_cache" || "$_mise_cache" -ot "$(which mise)" ]]; then
    mkdir -p "${_mise_cache:h}"
    mise activate zsh > "$_mise_cache"
  fi
  source "$_mise_cache"
fi

# Lazy/Cached UV completions
if command -v uv &> /dev/null; then
  _uv_comp_file="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/_uv"
  if [[ ! -f "$_uv_comp_file" || "$_uv_comp_file" -ot "$(which uv)" ]]; then
    mkdir -p "${_uv_comp_file:h}"
    uv generate-shell-completion zsh > "$_uv_comp_file"
  fi
  fpath+=("${_uv_comp_file:h}")
fi

# Kiro/VSCode shell integration (only when not already injected)
if [[ "$TERM_PROGRAM" == "kiro" && -z "$KIRO_SHELL_INTEGRATION" ]]; then
  . "/Applications/Kiro.app/Contents/Resources/app/out/vs/workbench/contrib/terminal/common/scripts/shellIntegration-rc.zsh"
fi

# ==============================================================================
# HOOKS & FUNCTIONS
# ==============================================================================
set_tmux_title() {
  if [ -n "$TMUX" ]; then
    tmux rename-window "${PWD##*/}"
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd set_tmux_title
set_tmux_title

autoload -Uz create-workspace remove-workspace open-workspace