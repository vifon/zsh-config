#!/bin/sh
mkdir $HOME/.zplugins
for f in zplugins/*; do
    ln -v -s "`readlink -e "$f"`" "$HOME/.zplugins"
done
ln -v -s "`readlink -e zlogin`"  $HOME/.zlogin
ln -v -s "`readlink -e zlogout`" $HOME/.zlogout
ln -v -s "`readlink -e zloader`" $HOME/.zloader
ln -v -s "`readlink -e zprompt`" $HOME/.zprompt
ln -v -s "`readlink -e zshrc`"   $HOME/.zshrc
