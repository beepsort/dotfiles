#!/bin/sh

echo Setting up vim
ln -s $(pwd)/.vimrc ~/.vimrc

echo Setting up doom emacs...
ln -s $(pwd)/.doom.d ~/.doom.d

echo Setting up VSCode...
ln -s $(pwd)/Code/User/settings.json ~/.config/Code/User/settings.json
ln -s $(pwd)/Code/User/keybindings.json ~/.config/Code/User/keybindings.json

echo Done!
