#!/bin/sh

echo Setting up vim
ln -s -v $(pwd)/.vimrc ~/.vimrc

echo Setting up doom emacs...
ln -s -v $(pwd)/.doom.d ~/.doom.d

echo Setting up VSCode...
ln -s -v $(pwd)/Code/User/settings.json ~/.config/Code/User/settings.json
ln -s -v $(pwd)/Code/User/keybindings.json ~/.config/Code/User/keybindings.json

echo Done!
