########### ALIASES
# File
alias la="exa --icons --header --group-directories-first -a"
alias lla="exa --icons --header --group-directories-first -la"
alias ll="exa --icons --header --group-directories-first -l"
alias tree="exa --tree --level=3"
alias l="exa --group-directories-first --icons"
#alias la="exa --icons -lgha --group-directories-first"
alias lt="exa --icons --tree"
alias lta="exa --icons --tree -lgha"
alias bat="bat --theme OneHalfDark"
#alias cat="bat --theme OneHalfDark -p $@"
alias paths="echo $PATH | tr \" \" \"\n\""
alias grep='grep --color=auto'
alias histogrep='history | grep'
alias cd..="cd ../"

# Neovim
alias nv="nvim"
alias nvnit="nvim ~/.config/nvim/init.vim"

# Sh files
alias zshrc="nvim ~/.zshrc"
alias bashrc="nvim ~/.bashrc"
alias fishrc="nvim ~/.config/fish/config.fish"

# Package mamager
alias update="apt update"
alias upgrade="apt upgrade"

#speedtest-go
alias speedtest="speedtest-go"

#asciinema
alias reconf="nvim ~/.config/asciinema/config"
alias record="asciinema rec"
alias replay="asciinema play"

#termux-reload
alias reload="termux-reload-settings"

#termux-setting
alias term-conf="nvim ~/.termux/termux.properties"

#termux-permission
alias set-storage="termux-setup-storage"
#alias arch="proot-distro login --isolated --user steve archlinux"

########### EXPORTS
# TERMINAL DEFAULTS
export EDITOR=nvim
export HISTCONTROL=ignoreboth
export TERM=xterm-256color
export DIFFPROG='nvim -d'

export PATH="$PATH:$HOME/.local/bin"

# MANPAGES
set -x LESS_TERMCAP_mb (printf "\e[1;32m")
set -x LESS_TERMCAP_md (printf "\e[1;32m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[1;4;32m")
set -x GROFF_NO_SGR 1

set -x MANPAGER 'less -s -M +Gg'

# GITHUB
export LINK="https://github.com/steguiosaur"
export LINK_SSH="git@github.com:steguiosaur"

# JAVA (JDK/Android SDK)
#export ANDROID_SDK_ROOT="~/Android/sdk"
#export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export JAVA_HOME="$PREFIX/opt/openjdk"
#export PATH="$PATH:$ANDROID_SDK_ROOT/build-tools/30.0.3"

# LATEX (fish config)
export PATH="$PATH:$PREFIX/bin/texlive"
export TEXMFROOT="$PREFIX/share/texlive"
export TEXMFLOCAL="$PREFIX/share/texlive/texmf-local"
export OSFONTDIR="$PREFIX/share/fonts/TTF"
export TRFONTS="$PREFIX/share/groff/{current/font,site-font}/devps"

export LD_LIBRARY_PATH="$PREFIX/lib"

# RUST
export PATH="$PATH:$HOME/.cargo/bin"
