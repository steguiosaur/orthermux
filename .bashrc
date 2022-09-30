
# ALIASES
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias nv='nvim'
alias grep='grep --color=auto'
alias ..='cd ..'

# EXPORTS
export EDITOR=nvim
export HISTCONTROL=ignoreboth
export TERM=xterm-256color

# JDK-17
export ANDROID_SDK_ROOT="$HOME/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export JAVA_HOME="$HOME/../usr/opt/openjdk"

. "$HOME/.cargo/env"
