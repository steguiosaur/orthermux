#! /bin/bash

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
bgyellow="\033[1;43;33m"
bgwhite="\033[1;47;37m"
c0=${reset}
c1=${magenta}
c2=${green}
c3=${white}
c4=${blue}
c5=${red}
c6=${yellow}
c7=${cyan}
c8=${black}
c9=${bgyellow}
c10=${bgwhite}

# Repository Name
function titleName() {
    clear
    echo -e "\n  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    echo -e "  ┃${c4}  █▀▀█ █▀▀█ ▀▀█▀▀ █  █ █▀▀▀ █▀▀█ █▀▄▀█ █  █ ▀▄ ▄▀  ${c0}┃"
    echo -e "  ┃${c4}  █  █ █▄▄▀   █   █▀▀█ █▀▀▀ █▄▄▀ █ █ █ █  █   █    ${c0}┃"
    echo -e "  ┃${c4}  █▄▄█ █  █   █   █  █ █▄▄▄ █  █ █   █ ▀▄▄▀ ▄▀ ▀▄  ${c0}┃"
    echo -e "  ┃${c7}    Termux configuration: steguiosaur/orthermux.   ${c0}┃"
    echo -e "  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"
}

# Main menu UI
function displayMainMenu() {
    echo -e "Select action:\n\n${c7}--- Required${c0}"
    echo -e "[1] Install Required Packages"
    echo -e "[2] Apply Configurations"
    echo -e "\n${c7}--- Additional Setup${c0}"
    echo -e "[3] Java Development Setup"
    echo -e "[4] (-- unfixed) LaTeX setup"
    echo -e "\n[Q] Quit\n"
}

# Pause current menu
function anyKey() {
    read -n 1 -r -s -p "Enter to continue. [*] " any
}

# Confirm update and upgrade packages if not yet executed.
function updateUpgrade() {
    echo -e "Run \"apt update && apt upgrade\" before proceeding."
    while true; do
        read -r -p "Update and upgrade packages? [Y/N] " ans
        case $ans in
            Y | y ) 
                titleName
                apt update -y && apt upgrade -y
                pkg update -y && pkg upgrade -y;
                anyKey
                break;;
            N | n ) echo " "; break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

# PACKAGES (necessary)
aptRequired=(
    "wget"
    "curl"
)

pkgRequired=(
    # repos
        "root-repo"
        "unstable-repo"
        "x11-repo"
    # Priorities
        "clangd"
        "python"
        "python2"
        "zsh"
        "fish"
        "zip"
        "unzip"
        "php"
    # Editors and Tiling
        "tmux"
        "neovim"
        "vim"
        "nano"
    # Miscellaneous
        "neofetch"
        "exa"
        "ctags"
)

# Runs all package arrays into installation
function forLoopPackages() {
    for apts in "${aptRequired[@]}"; do
        if [ ! -f "$PREFIX/bin/$apts" ]; then
            apt install $apts -y
        fi
    done
    titleName
    for pkg_req in "${pkgRequired[@]}"; do
        if [ ! -f "$PREFIX/bin/$pkg_req" ]; then
            pkg install $pkg_req -y
        fi
    done
    echo " "
}

# Installs required packages
function PackageInstalls() {
    titleName
    while true; do
        echo -e "Packages to Install:\n"
        for pkg_req in "${pkgRequired[@]}"; do
            echo -e "• $pkg_req"
        done
        echo " "
        read -r -p "Proceed? [Y/N] " ans
        case $ans in
            Y | y )
                titleName
                forLoopPackages
                anyKey
                break;;
            N | n ) echo " "; break;;
            * ) echo -e "\nAccepted values [Y/N/y/n]";;
        esac
    done
}

## Deleting standard termux prompt.
function motdDeletion() {
    if [ -f "$HOME/../usr/etc/motd" ]; then
        rm $HOME/../usr/etc/motd
    else
        echo -e " "
    fi
    echo -e "Done removing default Termux."
} 

function rxInstall() {
    ln -s 
    echo -e "Done installing rxfetch."
}

# Apply preset configurations of packages.
function applyConfig() {
    cp -r .config/neofetch .termux .tmux .tmux.conf $HOME
    echo -e "Done moving dotfiles. Restart session."
}

function doAll() {
    titleName
    motdDeletion
    titleName
    rxInstall
    titleName
    omfInstall
    titleName
    applyConfig
}

function UpdateOrthermux() {
    while true; do
        titleName
        echo -e "Select action to do.\n"
        echo -e "[1] Remove termux default display"
        echo -e "[2] Rxfetch"
        echo -e "[3] Install Oh-My-Fish"
        echo -e "[4] Apply dotfiles\n"
        echo -e "[A] Do All"
        echo -e "[Q] Main Menu\n"
        read -r -p "Input: " ans
        case $ans in
            1 ) 
                titleName
                motdDeletion
                anyKey;;
            2 ) 
                titleName
                rxInstall
                anyKey;;
            3 ) 
                titleName
                omfInstall
                anyKey;;
            4 ) 
                titleName
                applyConfig
                anyKey;;
            A ) 
                doAll
                anyKey;;
            Q | q ) break;;
            * ) continue;;
        esac
    done
}

# Installs jdk, gradle and others
function SetupJava() {
    titleName
    echo -e "Java Development on Termux is under maintenance.\n"
    anyKey
}

# LaTeX for Termux
function SetupLatex() {
    titleName
    echo -e "LaTeX configuration is under maintenance.\n"
    anyKey
}

#rxfetch display after exit.
function viewRxfetch() {
    clear
    if [ -x "$(command -v rxfetch)" ]; then
        rxfetch
    fi
} 

function main() {
    titleName
    updateUpgrade
    while true; do
        titleName
        displayMainMenu
        read -r -p "Input: " ans
        case $ans in
            1 ) PackageInstalls;;
            2 ) UpdateOrthermux;;
            3 ) SetupJava;;
            4 ) SetupLatex;;
            Q | q ) break;;
            * ) continue;;
        esac
    done
    viewRxfetch
}
main
