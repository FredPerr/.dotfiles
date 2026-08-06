# ==============================================================================
# PROFILING (Keep at top)
# ==============================================================================
zmodload zsh/zprof

# ==============================================================================
# OH MY ZSH CONFIGURATION
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"
DISABLE_COMPFIX="true"

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${HOST}-${ZSH_VERSION}"
if [[ -n ${ZSH_COMPDUMP}(#qN.m+1) ]]; then
  ZSH_COMPINIT_FLAGS=""
else
  ZSH_COMPINIT_FLAGS="-C"
fi

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

# Mise
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
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

# Kiro integrations
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

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