#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# EXPORTS
export LANG=UTF-8
export EDITOR=nvim
export DIFFPROG='nvim -d'
export TERM=xterm-256color

export LINK="https://github.com/steguiosaur"
export LINK_SSH="git@github.com:steguiosaur"

export PATH="$PATH:$HOME/.local/bin"

alias ls='ls --color=auto --group-directories-first -F'
alias l="ls --color=auto --group-directories-first -F"
alias la="ls -a --color=auto --group-directories-first -F"
alias ll="ls -l --color=auto --group-directories-first -F"
alias lla="ls -la --color=auto --group-directories-first -F"
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
