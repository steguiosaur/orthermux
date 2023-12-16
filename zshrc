#
#   ▒█▀▀▀█ ▒█▀▀▀█ ▒█░▒█ ▒█▀▀█ ▒█▀▀█ 
#   ░▄▄▄▀▀ ░▀▀▀▄▄ ▒█▀▀█ ▒█▄▄▀ ▒█░░░ 
#   ▒█▄▄▄█ ▒█▄▄▄█ ▒█░▒█ ▒█░▒█ ▒█▄▄█ 
#   --------- steguiosaur ---------

# OPTIONS
export LC_ALL="en_US.UTF-8"
export EDITOR='nvim'
export DIFFPROG='nvim -d'

export LINK="https://github.com/steguiosaur"
export LINK_SSH="git@github.com:steguiosaur"

export PATH="$PATH:$HOME/.local/bin"

# ALIASES
alias ls='ls --color=auto --group-directories-first -F'
alias l="ls --color=auto --group-directories-first -F"
alias la="ls -a --color=auto --group-directories-first -F"
alias ll="ls -l --color=auto --group-directories-first -F"
alias lla="ls -la --color=auto --group-directories-first -F"

function cd() {
    builtin cd "$@" && ls
}

alias paths="echo $PATH | tr \" \" \"\n\""
alias grep='grep --color=auto'
alias histogrep='history | grep'
alias cd..="cd ../"

alias nv="nvim"
alias vi="vim"
alias nvnit="nvim ~/.config/nvim/init.vim"

alias zshrc="nvim ~/.zshrc"
alias bashrc="nvim ~/.bashrc"
alias fishrc="nvim ~/.config/fish/config.fish"

# PROMPT
PROMPT='%F{green}%n%f@%F{white}%m%f %F{cyan}%3~%f%(?.. [%F{red}%?%f]) %F{yellow}%(#. # $)%f '

# Manpages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'
export GROFF_NO_SGR=1

export MANPAGER='less -s -M +Gg'

# HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.history-zsh
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# PLUGINS AND ADDITIONAL SOURCES
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# LATEX
#source $PREFIX/etc/profile.d/texlive.sh
