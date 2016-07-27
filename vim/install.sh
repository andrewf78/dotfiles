#!/usr/bin/env bash

# Install script for vim (neovim) setup.
set -e

# Check that git is installed.
if ! [ $(type -P git) ]
then
    echo "Git must be installed!"
    exit 1
fi

# Check that neovim is installed.
if ! [ $(type -P nvim) ]
then
    echo "NeoVIM must be installed. See https://neovim.io/"
    exit 1
fi

# Check that pip3 exists.
if ! [ $(type -P pip3) ]
then
    echo "pip3 must be installed!"
    exit 1
fi

# Check that the python3 neovim package is intalled.
if ! [ $(pip3 freeze | grep neovim) ]
then
    echo -n "Python3 neovim plugin package must be installed! Run: "
    echo " 'sudo pip3 install --upgrade neovim'"
    exit 1
fi

# Check that the proper directory structure exists.
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.config

# Ensure pathogen (vim pkg manager) is available.
if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
    echo -n "Unable to locate pathogen.vim. Installing pathogen... "
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo "success!"
fi

# Clone github dependencies from dependencies.log.
cwd=$PWD
cd ~/.vim/bundle
for dep in $(cat ${cwd}/dependencies.log)
do
    dest=$(basename $dep | sed 's/\.git//')
    if [ ! -d $dest ]
    then
        echo -n "Cloning dependency '$dep'... " 
        git clone $dep 2>&1 >  /dev/null
        echo "success!"
    fi
done
cd $cwd

# Move dotfile and colorscheme to the proper location.
cp andrew.vim ~/.vim/colors/.
cp .vimrc ~/.

# Setup .vimrc symlink for neovim.
if [ ! -d ~/.config/nvim ]
then
    ln -s ~/.vim ~/.config/nvim
fi

if [ ! -f ~/.config/nvim/init.vim ]
then
    ln -s ~/.vimrc ~/.config/nvim/init.vim
fi

echo "If deoplete has just been installed, be sure to run:"
echo " ':UpdateRemotePlugins' and restart neovim."
echo
echo "neovim settings installed successfully!"
exit 0

# EOF
