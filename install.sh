#!/bin/sh
#
# Coreys Automatic Ricing Script
#

if [ "`whoami`" = "root" ]; then
    echo "Are you ready to start the script? [y/N]: "
    read yesOrNo
    echo "\n"
    if [ "$yesOrNo" = "y" ]; then
        echo "Script starting...\n"
        echo "What user would you like to install the configuration of the window manager to?: "
        read USER
        echo "\n"
        echo "Updating system\n\n"
        # Updating the system and installing some packages
        cp sources.list /etc/apt/sources.list
        sudo apt-get update -y && sudo apt-get upgrade -y
        sudo apt-get install zip unzip git bspwm sxhkd xorg pulseaudio flameshot neofetch fonts-noto-color-emoji fonts-font-awesome libqt5svg5 lxpolkit dunst kitty polybar neovim zsh pcmanfm pulsemixer texlive-full gimp -y
        cd dots
        cp -r * /home/$USER
        cp -r .* /home/$USER
    else
        echo "Input must be 'y' to use the script.\n"
    fi
    
else
    echo "Please re-run script as root, this can be done as so:\n"
    echo "    $ sudo su\n"
    echo "    # ./install.sh\n"
fi
