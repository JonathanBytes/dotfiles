# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# export PIPEWIRE_LATENCY="128/48000"

export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH=$HOME/.config/rofi/bin:$PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/bin:/usr/.local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export VISUAL=lvim
export EDITOR="$VISUAL"
export XCURSOR_THEME=Pear

# Iraf binaries path
export PATH=$HOME/.iraf/bin/:$PATH
# Iraf environment variable
export iraf=home/jonathan/Downloads/irafInstaller/iraf-2.17/

export PATH=$HOME/Downloads/ds9Installer/SAOImageDS9/bin/:$PATH
export PYTHONPATH=$HOME/.local/lib/python3.10/site-packages:$PYTHONPATH
export EIGEN3_INCLUDE_DIR=/usr/include/eigen3

# fnm
export PATH="/home/jonathan/.local/share/fnm:$PATH"
eval "`fnm env`"

# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

plugins=(
  git
	zsh-autosuggestions
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# omz
alias zshconfig="lvim ~/.zshrc"

# ls
alias l='exa -lh'
alias ll='exa -lah'
alias la='ls -A'
alias lm='exa -m'
alias lr='exa -R'
alias lg='exa -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gcp='git checkout -b'

# Nvim
alias n='~/.local/bin/lvim'

# Trash-cli
alias rm='trash-put'

# Cat with colors
alias cat='bat'

# Python alias
alias p='python'

# PDF reader alias
alias z='zathura'

# Misc
alias matlab='export _JAVA_AWT_WM_NONREPARENTING=1;matlab'
alias o='octave'
alias b='btop'
alias smbshare='cd /tmp/sambashare'
alias term='wezterm start --cwd $PWD'
alias dn='dotnet new'
alias dr='dotnet run'

# Iraf
alias irafds9='/usr/local/bin/irafStart.sh'
alias iraf='ecl'

# LaTex preset
alias docStart='cp ~/LaTex/* .'

# Ngrok deployment
alias deploy='ngrok http --domain=wombat-grown-walrus.ngrok-free.app'

# Create directory and cd to it
mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

number=$(($RANDOM % 3))
if [[ $number == 0 ]]; then
  pokemon-colorscripts -r 1 --no-title
elif [[ $number == 1 ]]; then
  {neofetch}
else
  {nitch}
fi

# bun
[ -s "/home/jonathan/.bun/_bun" ] && source "/home/jonathan/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun end

# pnpm
export PNPM_HOME="/home/jonathan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
 
# pip zsh completion start
#compdef -P pip[0-9.]#
__pip() {
  compadd $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$((CURRENT-1)) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null )
}
if [[ $zsh_eval_context[-1] == loadautofunc ]]; then
  # autoload from fpath, call function directly
  __pip "$@"
else
  # eval/source/. command, register function for later
  compdef __pip -P 'pip[0-9.]#'
fi
# pip zsh completion end
 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
