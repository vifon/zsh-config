#!/bin/sh
mkdir -p $HOME/.zplugins
for f in zplugins/*; do
    ln -s "`readlink -e "$f"`" "$HOME/.zplugins" 2> /dev/null &&
    echo "[32;1m$f[0m" 1>&2 ||
    echo "[31;1m$f[0m" 1>&2
done
for f in zlogin zlogout zloader zprompt zshrc; do
    ln -s "`readlink -e "$f"`" "$HOME/.$f" 2> /dev/null &&
    echo "[32;1m$f[0m" 1>&2 ||
    echo "[31;1m$f[0m" 1>&2
done
