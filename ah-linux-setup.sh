#!/bin/bash

function replace-file 
{
    cp $1 $1.bak
    wget -q -O $1 $2
}

# TMux

replace-file ~/.bash_profile https://raw.githubusercontent.com/ah01/linux-setup/master/.bash_profile
replace-file ~/.tmux.conf https://raw.githubusercontent.com/ah01/linux-setup/master/.tmux.conf



echo test
