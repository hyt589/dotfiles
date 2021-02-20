#!/bin/bash

set -e

SCRIPT_ROOT="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

if ! type -t nvm &> /dev/null
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi

nvm install node
npm install -g neovim

python3 -m pip install --user --upgrade pynvim ranger-fm

cd $SCRIPT_ROOT

echo 'Set up complete.'
echo 'You can pull the nerd-fonts submodule to patch the fonts if you want to.'
echo '    run: git submodule update --init --recursive --depth 1'
echo 'Beware it is a huge repo'
