#
#   ▒█▀▀▀█ ▒█▀▀▀█ ▒█░▒█ ▒█▀▀█ ▒█▀▀█ 
#   ░▄▄▄▀▀ ░▀▀▀▄▄ ▒█▀▀█ ▒█▄▄▀ ▒█░░░ 
#   ▒█▄▄▄█ ▒█▄▄▄█ ▒█░▒█ ▒█░▒█ ▒█▄▄█ 
#   --------- steguiosaur ---------

# OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh"
 #ZSH_THEME="agnoster"
plugins=(
    git 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    zsh-fzf-history-search
)

# TERMINAL DEFAULTS
export EDITOR=nvim
export HISTCONTROL=ignoreboth
export TERM=xterm-256color

# GITHUB
export LINK="https://github.com/steguiosaur"
export LINK_SSH="git@github.com:steguiosaur"

# JDK-17
export ANDROID_SDK_ROOT="$HOME/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export JAVA_HOME="$HOME/../usr/opt/openjdk"

# CUSTOM BIN
export PATH="$HOME/.local/bin"

# RUSTC
#. "$HOME/.cargo/env"

# SOURCES
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.autostart
#source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
