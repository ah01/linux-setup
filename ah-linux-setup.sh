#!/bin/bash

SP=https://raw.githubusercontent.com/ah01/linux-setup/master/

function replace-file 
{
    echo Replace $1 with $2
    cp $1 $1.bak
    wget -q -O $1 $2
}

# TMux

sudo apt-get install tmux

replace-file ~/.bashrc $SP.bashrc
replace-file ~/.bash_profile $SP.bash_profile
replace-file ~/.tmux.conf $SP.tmux.conf



echo Done.
