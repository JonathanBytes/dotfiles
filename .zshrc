#!/bin/zsh

##############################
# Environment Variables
##############################

# Export necessary paths
export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH=$HOME/.config/rofi/bin:$PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/bin:/usr/local/bin:$PATH

# Custom directories
export ZSH="$HOME/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=true
export VISUAL=lvim
export EDITOR="$VISUAL"
export XCURSOR_THEME=Pear

# Iraf binaries path
export PATH=$HOME/.iraf/bin/:$PATH
# Iraf environment variable
export iraf=~/Downloads/irafInstaller/iraf-2.17/

# DS9 installer path
export PATH=$HOME/Downloads/ds9Installer/SAOImageDS9/bin/:$PATH
# Python module location
export PYTHONPATH=$HOME/.local/lib/python3.10/site-packages:$PYTHONPATH
# Eigen library include dir
export EIGEN3_INCLUDE_DIR=/usr/include/eigen3

# FNM Path
export PATH="/home/jonathan/.local/share/fnm:$PATH"

# ZSH Plugins
plugins=(
git
zsh-autosuggestions
)
bindkey '^ ' autosuggest-accept

##############################
# Function Definitions
##############################

# Define custom functions
function mkcdir(){
  mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# Define dotnet autocomplete function
_dotnet_zsh_complete() {
local completions=("$(dotnet complete "$words")")
reply=( "${(ps:\n:)completions}" )
}

# Register dotnet autocomplete function
compctl -K _dotnet_zsh_complete dotnet

##############################
# Configuration Options
##############################

# Personal aliases
alias zshconfig="lvim ~/.zshrc"
alias ohmyzsh="lvim ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# OMZ Configurations
source $ZSH/oh-my-zsh.sh

# Starship Prompt
eval "$(starship init zsh)"

# Startup Scripts
number=$(($RANDOM % 3))
if [[ $number == 0 ]]; then
  pokemon-colorscripts -r 1 --no-title
elif [[ $number == 1 ]]; then
  neofetch
else
  nitch
fi

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/jonathan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh    # For zsh

# ESP-IDF
# source /opt/esp-idf/export.sh

# pip zsh completion
#compdef -P pip[0-9.]#
__pip() {
  compadd $( COMP_WORDS="$words[*]" \
            COMP_CWORD=$((CURRENT-1)) \
            PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null )
}
if [[ $zsh_eval_context[-1] == loadautofunc ]]; then
  # Autoloaded from fpath, call function directly
  __pip "$@"
else
  # Sourced/Evaluated, register function for future use
  compdef __pip -P 'pip[0-9.]#'
fi

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-Correct Spelling
setopt correctall

# Colorize Directory Listings
LSCOLORS="ExFxcxdxbxegedabagacad"

# Git Alias
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gcp='git checkout -b'

# Copilot aliases
alias ghcs='gh copilot suggest'
alias ghce='gh copilot explain'

# Nvim
alias n='lvim'

# Trash Cli
alias rm='trash-put'

# Cat With Colors
alias cat='bat'

# Python Alias
alias p='python'

# Miscellaneous Alias
alias matlab='export _JAVA_AWT_WM_NONREPARENTING=1;matlab'
alias o='octave'
alias b='btop'
alias smbshare='cd /tmp/sambashare'
alias term='wezterm start --cwd $PWD'
alias dn='dotnet new'
alias dr='dotnet run'

# Navigation
alias tree='exa -T'
alias ls='exa'
alias la='exa -a'
alias ll='exa -la'

# Iraf
alias irafds9='/usr/local/bin/irafStart.sh'
alias iraf='ecl'

# LaTeX Presets
alias docStart='cp ~/LaTeX/* .'

# Deployment
alias deploy='ngrok http --domain=wombat-grown-walrus.ngrok-free.app'

# ESP32
alias esp-upload='arduino-cli upload --fqbn esp32:esp32:esp32:UploadSpeed=115200 --log'
alias esp-compile='arduino-cli compile --fqbn esp32:esp32:esp32 --log'
alias esp-compile-s3='arduino-cli compile --fqbn esp32:esp32:esp32s3usbotg --log'
alias esp-upload-s3='arduino-cli upload --fqbn esp32:esp32:esp32s3usbotg --log'

# Zoxide Init
eval "$(zoxide init zsh)"

# Create Dir And CD To It
mkcdir () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# End Of File




export PATH=$PATH:/home/jonathan/.millennium/ext/bin

# bun completions
[ -s "/home/jonathan/.bun/_bun" ] && source "/home/jonathan/.bun/_bun"
