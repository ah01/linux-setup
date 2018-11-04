#!/bin/bash

SP=https://raw.githubusercontent.com/ah01/linux-setup/master/user/

# -----------------------------------------------------------------------------

function replace-file 
{
    echo Replace $1 with $2
    cp $1 $1.bak
    wget -q -O $1 $2
}

# -----------------------------------------------------------------------------

sudo apt-get install htop

replace-file ~/.bashrc $SP.bashrc
replace-file ~/.bash_profile $SP.bash_profile

# --- tmux ---

read -p "Setup tmux (y/n)? " input

if [[ $input == "y" ]]; then

    # install tmux
    sudo apt-get install tmux
    # copy config file
    replace-file ~/.tmux.conf $SP.tmux.conf

    # run tmux after bash
    echo "tmux attach" >> ~/.bash_profile

fi

# -----------------------------------------------------------------------------

echo Done.
