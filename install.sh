#!/bin/sh

LN="ln"

if [ "$1" = "--overwrite" ]; then
    LN="ln -f"
fi

mkdir -p $HOME/.zplugins
for f in zplugins/*; do
    $LN -s "`readlink -e "$f"`" "$HOME/.zplugins" 2> /dev/null &&
    echo "[32;1m$f[0m" 1>&2 ||
    echo "[31;1m$f[0m" 1>&2
done
for f in zlogin zlogout zloader zprompt zshrc zshenv; do
    $LN -s "`readlink -e "$f"`" "$HOME/.$f" 2> /dev/null &&
    echo "[32;1m$f[0m" 1>&2 ||
    echo "[31;1m$f[0m" 1>&2
done
