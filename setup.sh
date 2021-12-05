#!/bin/sh

confirm_delete()
{
    response=y
    if [ $OVERWRITE != 0 ]; then
        read -r -p "Replacing $1, are you sure? [y/N] " response
    fi
    case "$response" in
        [yY][eE][sS]|[yY]) 
            rm $1
	        ;;
        *)
            echo skipping...
	        ;;
    esac
}

install_file()
{
    echo ~/$1
    if test -e ~/$1; then
        confirm_delete ~/$1
    fi
    if [ ! -e ~/$1 ]; then
        ln -s -v $(pwd)/$1 ~/$1
    fi
}

if [ $# = 1 ] && [ $1 = "-y" ]; then
    OVERWRITE=0
else
    OVERWRITE=-1
fi

echo Setting up Tmux
install_file .tmux.conf

echo Setting up vim
install_file .vimrc

echo Setting up neovim
install_file .config/nvim/init.lua
install_file .config/nvim/lua/conf

echo Setting up doom emacs...
install_file .doom.d

echo Setting up VSCode...
install_file .config/Code/User/settings.json
install_file .config/Code/User/keybindings.json

echo Done!
