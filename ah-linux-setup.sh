#!/bin/bash

SP=https://raw.githubusercontent.com/ah01/linux-setup/master/user/

# -----------------------------------------------------------------------------

function replace-file 
{
    echo "  replace $1 with $2"
    cp $1 $1.bak
    wget -q -O $1 $2
}

# -----------------------------------------------------------------------------

# applications
sudo apt-get install htop tree

# profile files
echo "Replace basic profile files"
replace-file ~/..welcome-info.sh $SP.welcome-info.sh
replace-file ~/.bashrc $SP.bashrc
replace-file ~/.bash_profile $SP.bash_profile

# --- ssh key ---

read -p "Add authorized_keys (y/n)? " input

if [[ $input == "y" ]]; then
    
    echo "Add authorized_keys:"

    if [ ! -f ~/.ssh/authorized_keys ]; then
        echo "  create .ssh directory"

        mkdir -p ~/.ssh 
        touch ~/.ssh/authorized_keys 
        chmod 700 ~/.ssh 
        chmod 600 ~/.ssh/authorized_keys
    fi

    KEYLINE="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAyL00C9xl6B4G2hc2sudDH2OYZMYBVR8IQMzSawJ/wha34IEjOeA0btUNO5Un25kinvC5NC8IialuVvExCwktAN2xT/ZNSBoKMCzHyWgoPnDPIRw+IhcTa41Kw28Hnw5hCR07s2B4QfQu25/Mzw9JtoQ+SdkZAHt2QWbJPNJJ6xUccteGvPh3bH7O27aU+1zd53eXrEhI2wAUpeVcT+Ld+gBOhqY0ftz3Qm1/ywrGBnGKJitnjJ0HHqli/bWaGsGoYIE8CjWJ50kLLK0j4VJ+tIopGRgEoo/GIZnMNYUcyJHsyGwj8gMd0+AAC6+0iWXNDpKkOOQae/eWeoHbqm2Pww== rsa-key-20130509"

    if ! grep -q "$KEYLINE" ~/.ssh/authorized_keys; then
        echo "  append key"
        echo $KEYLINE >> ~/.ssh/authorized_keys
    fi

    echo "  done"
fi

# --- tmux ---

read -p "Setup tmux (y/n)? " input

if [[ $input == "y" ]]; then

    echo "Setup tmux"

    # install tmux
    sudo apt-get install tmux

    # copy config file
    replace-file ~/.tmux.conf $SP.tmux.conf
    
    # run tmux after bash
    echo "tmux attach" >> ~/.bash_profile

    echo "  done"
fi

# -----------------------------------------------------------------------------

echo Done.
