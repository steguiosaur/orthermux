#! /bin/bash

#######################################################################
######################## steguiosaur/orthermux ########################
#######################################################################

############################### DISPLAY ############################### 
# colors
magenta="\033[1;35m"
green="\033[1;32m"
white="\033[1;37m"
blue="\033[1;34m"
red="\033[1;31m"
black="\033[1;40;30m"
yellow="\033[1;33m"
cyan="\033[1;36m"
reset="\033[0m"
c0=${reset}
c1=${magenta}
c2=${green}
c3=${white}
c4=${blue}
c5=${red}
c6=${yellow}
c7=${cyan}
c8=${black}

# Repository Name
function TITLENAME() {
    clear
    echo -e "\n  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    echo -e "  ┃${c4}  █▀▀█ █▀▀█ ▀▀█▀▀ █  █ █▀▀▀ █▀▀█ █▀▄▀█ █  █ ▀▄ ▄▀  ${c0}┃"
    echo -e "  ┃${c4}  █  █ █▄▄▀   █   █▀▀█ █▀▀▀ █▄▄▀ █ █ █ █  █   █    ${c0}┃"
    echo -e "  ┃${c4}  █▄▄█ █  █   █   █  █ █▄▄▄ █  █ █   █ ▀▄▄▀ ▄▀ ▀▄  ${c0}┃"
    echo -e "  ┃${c7}    Termux configuration: steguiosaur/orthermux    ${c0}┃"
    echo -e "  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"
}

# Pauses current menu.
function anyKey() {
    echo " "
    read -n 1 -r -s -p "Enter to continue. [*] " any
}

error=("${c5}ERROR${c0}:")

###################### UPDATE PACKAGES FUNCTIONS ###################### 
# Confirm update and upgrade packages if not yet executed.
function UPDATE_UPGRADE_PKG() {
    echo -e "Run \"apt update && apt upgrade\" before proceeding."
    while true; do
        read -r -p "Update and upgrade packages? [Y/N] " ans
        case $ans in
            Y | y ) TITLENAME
                apt update -y && apt upgrade -y
                pkg update -y && pkg upgrade -y;
                anyKey
                break;;
            N | n ) break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

###################### PACKAGE INSTALL FUNCTIONS ###################### 
# PACKAGES (necessary)
packages=("python python2 wget clang zsh fish lua zip unzip vim neovim php tmux nano neofetch ctags exa")

# Installs required packages
function PACKAGEINSTALL() {
    TITLENAME
    while true; do
        echo -e "Packages to Install:\n"
        echo -e "${c4}$packages\n\n${c0}" | tr " " "\n"
        read -r -p "Proceed? [Y/N] " ans
        case $ans in
            Y | y ) TITLENAME
                pkg install $pkg_req -y
                anyKey
                break;;
            N | n ) break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

###################### APPLY CONFIG FUNCTIONS ###################### 
function apply_config_UI() {
    TITLENAME
    echo -e "Select action to do.\n"
    echo -e "${c6}[1]${c0} Orthermux Dotfiles"
    echo -e "${c6}[2]${c0} Apply Package Config"
    echo -e "${c6}[3]${c0} Powerlevel 10k prompt"
    echo -e "${c6}[4]${c0} Install Oh-My-Zsh\n"
    echo -e "${c6}[A]${c0} Do All"
    echo -e "${c6}[Q]${c0} Main Menu\n"
}

function dotfile_apply() {
    cp ./.termux $HOME 
    cp ./.bashrc ./.zshrc ./.aliases ./.autostart $HOME
    cp -r ./.local/bin $HOME/.local
    if [ -f "$PREFIX/etc/motd" ]; then
        rm $PREFIX/etc/motd
    fi
}

function config_apply() {
    cp -r ./.config ./.tmux.conf $HOME
    cp ./.tmux ./.gitconfig $HOME
    git clone https://github.com/steguiosaur/nvim $HOME/.config/nvim
}

function powerlevel_install() {
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>$HOME/.zshrc
}

function ohmyzsh_install() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exit
}

function doAll() {
    TITLENAME
    dotfile_apply
    TITLENAME
    config_apply
    TITLENAME
    ohmyzsh_install
}

function applyDotfiles() {
    while true; do
        echo -e "Start-up Prompt: Rxfetch"
        echo -e "Terminal: Tundra Modified"
        echo -e "Font: Terminus"
        echo -e "Shell: zsh\n"
        read -r -p "Apply Termux configurations? [Y/N] " ans
        case $ans in
            Y | y ) TITLENAME
                dotfile_apply
                echo -e "Done."
                anyKey
                break;;
            N | n ) break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

function applyPkgConfig() {
    while true; do
        echo -e "Changes themes of the following packages.\n"
        echo -e "• Neovim\n• Neofetch\n• Tmux"
        read -r -p "Apply configurations? [Y/N]" ans
        case $ans in
            Y | y ) TITLENAME
                config_apply
                echo -e "Done."
                anyKey
                break;;
            N | n ) break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

function applyPrompt() {
    while true; do
        echo -e "Powerlevel 10k Installer.\n"
        read -r -p "Install? [Y/N]" ans
        case $ans in
            Y | y ) TITLENAME
                powerlevel_install
                echo -e "\nDone."
                anyKey
                break;;
            N | n ) break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

function ohMyZsh() {
    while true; do
        echo -e "Oh-My-Zsh Installer.\n"
        read -r -p "Install? [Y/N]" ans
        case $ans in
            Y | y ) TITLENAME
                ohmyzsh_install
                echo -e "\nDone."
                anyKey
                break;;
            N | n ) break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

function APPLYCONFIG() {
    while true; do
        apply_config_UI
        read -r -p "Input: " ans
        case $ans in
            1 ) TITLENAME
                applyDotfiles
                anyKey;;
            2 ) TITLENAME
                applyPkgConfig
                anyKey;;
            3 ) TITLENAME
                applyPrompt
                anyKey;;
            4 ) TITLENAME
                ohMyZsh
                anyKey;;
            A | a ) doAll
                anyKey;;
            Q | q ) break;;
            * ) continue;;
        esac
    done
}

###################### OTHER REMAINING FUNCTIONS ###################### 
# Installs jdk, gradle and others
function JAVA_SETUP() {
    TITLENAME
    echo -e "$error Java Development on Termux is under maintenance."
    anyKey
}

# LaTeX for Termux
function LATEX_SETUP() {
    TITLENAME
    echo -e "$error LaTeX configuration is under maintenance."
    anyKey
}

#rxfetch display after exit.
function viewRxfetch() {
    if [ -x "$(command -v rxfetch)" ]; then
        rxfetch
    fi
} 

############################ MAIN FUNCTION ############################ 
# Main Menu UI
function DISPLAY_MAIN_MENU() {
    echo -e "Select action:\n\n${c7}--- Required${c0}"
    echo -e "${c6}[1]${c0} Install Required Packages"
    echo -e "${c6}[2]${c0} Apply Configurations"
    echo -e "\n${c7}--- Additional Setup${c0}"
    echo -e "${c6}[3]${c0} $error Java Development Setup"
    echo -e "${c6}[4]${c0} $error LaTeX setup"
    echo -e "\n${c6}[Q]${c0} Quit\n"
}

function main() {
    TITLENAME
    UPDATE_UPGRADE_PKG
    while true; do
        TITLENAME
        DISPLAY_MAIN_MENU
        read -r -p "Input: " ans
        case $ans in
            1 ) PACKAGEINSTALL;;
            2 ) APPLYCONFIG;;
            3 ) JAVA_SETUP;;
            4 ) LATEX_SETUP;;
            Q | q ) break;;
            * ) continue;;
        esac
    done
    clear
    viewRxfetch
}
main
