set -U fish_greeting ""
clear
rxfetch
alias nv=nvim
alias la="exa --icons --header -la"
alias ll="exa --icons --header -l"
alias tree="exa --tree --level=3"

export ANDROID_SDK_ROOT="$HOME/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export JAVA_HOME=/data/data/com.termux/files/usr/opt/openjdk

# export PATH=/data/data/com.termux/files/usr/share/texlive/bin/aarch64-linux:$PATH
# export MANPATH=/data/data/com.termux/files/usr/share/texlive/texmf-dist/doc/man:$MANPATH
# export INFOPATH=/data/data/com.termux/files/usr/share/texlive/texmf-dist/doc/info:$INFOPATH

# Logfile: /data/data/com.termux/files/usr/share/texlive/install-tl.log
