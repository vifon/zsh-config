#!/bin/sh
mkdir $HOME/.zplugins
for f in zplugins/*; do
    ln -s "`readlink -e "$f"`" "$HOME/.zplugins"
done
ln -s zlogin  $HOME/.zlogin
ln -s zlogout $HOME/.zlogout
ln -s zloader $HOME/.zloader
ln -s zprompt $HOME/.zprompt
ln -s zshrc   $HOME/.zshrc
