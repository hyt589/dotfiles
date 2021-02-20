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
    for PKG in $SCRIPTPATH/*; do
        if [ -d "$PKG" ]; then
            echo "Stowing $PKG"
            CONFLICTS=$(stow --no --verbose -d $SCRIPTPATH -t ~ ${PKG##*/} 2>&1 | awk '/\* existing target is/ {print $NF}')
            for filename in $CONFLICTS; do
                if [[ -f "~/$filename" || -L "~/$filename" ]]; then
                    echo "Delete ~/$filename"
                    rm -f ~/$filename
                fi
            done
            stow -d $SCRIPTPATH -t ~ ${PKG##*/}
        fi
    done
else
    echo "Setting up symlinks"
    ln -sf $SCRIPTPATH/vim/.vim/vimrc ~/.vim/vimrc
    ln -sf $SCRIPTPATH/vim/.config/nvim/init.vim ~/.config/nvim/init.vim
    ln -sf $SCRIPTPATH/git/.gitconfig ~/.gitconfig
fi

