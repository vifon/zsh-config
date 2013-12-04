#!/bin/zsh

LN="ln"

while getopts "f" ARG; do
    case "$ARG" in
        f)
            LN="ln -f" ;;
        ?)
            ;;
    esac
done
shift $[$OPTIND-1]

mkdir -p $HOME/.zplugins
for f in zplugins/*; do
    OUTPUT=$($=LN -sv $f:A $HOME/.zplugins 2>&1)
    if [ "$?" = "0" ]; then
        echo "[32;1m$OUTPUT[0m" 1>&2
    else
        echo "[31;1m$OUTPUT[0m" 1>&2
    fi
done
for f in zlogin zlogout zloader zprompt zshrc zshenv; do
    OUTPUT=$($=LN -sv $f:A $HOME/.$f 2>&1)
    if [ "$?" = "0" ]; then
        echo "[32;1m$OUTPUT[0m" 1>&2
    else
        echo "[31;1m$OUTPUT[0m" 1>&2
    fi
done
