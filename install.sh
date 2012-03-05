#!/bin/sh
mkdir $HOME/.zplugins
for f in zplugins/*; do
    ln -s "`readlink -e "$f"`" "$HOME/.zplugins"
done
ln -s "`readlink -e zlogin`"  $HOME/.zlogin
ln -s "`readlink -e zlogout`" $HOME/.zlogout
ln -s "`readlink -e zloader`" $HOME/.zloader
ln -s "`readlink -e zprompt`" $HOME/.zprompt
ln -s "`readlink -e zshrc`"   $HOME/.zshrc
