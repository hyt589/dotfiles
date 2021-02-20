#!/bin/bash

set -e

# Absolute path to this script
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in
SCRIPTPATH=$(dirname "$SCRIPT")

source $SCRIPTPATH/vim/setup.sh

if command -v stow &> /dev/null
then
    echo "Stowing configurations"
    for SUBDIR in $SCRIPTPATH/*; do
        if [ -d "$SUBDIR" ]; then
            echo ${SUBDIR##*/}
            stow -d $SCRIPTPATH -t ~ ${SUBDIR##*/}
        fi
    done
else
    echo "Setting up symlinks"
    ln -sf $SCRIPTPATH/vim/.vim/vimrc ~/.vim/vimrc
    ln -sf $SCRIPTPATH/vim/.config/nvim/init.vim ~/.config/nvim/init.vim
    ln -sf $SCRIPTPATH/git/.gitconfig ~/.gitconfig
fi

