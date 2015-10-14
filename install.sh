#!/bin/zsh

LN="ln"

while getopts "fs" ARG; do
    case "$ARG" in
        f)
            LN="ln -f" ;;
        s)
            git submodule update --init
            ;;
        ?)
            ;;
    esac
done
shift $[$OPTIND-1]

link_fun()
{
    local OUTPUT
    if OUTPUT=$($=LN -sv $1 $2 2>&1); then
        echo "\e[32;1m$OUTPUT\e[0m" 1>&2
    else
        echo "\e[31;1m$OUTPUT\e[0m" 1>&2
    fi
}

mkdir -p $HOME/.zplugins
for f in zplugins/*; do
    link_fun $f:A $HOME/.zplugins
done
for f in zlogin zlogout zloader zprompt zshrc zshenv; do
    link_fun $f:A $HOME/.$f
done

mkdir -p $HOME/.fpath
for f in zplugins/deer.d/deer zplugins/zranger.d/zranger; do
    link_fun $HOME/.$f $HOME/.fpath/
done
link_fun $HOME/.zplugins/texas.d/texas.zsh $HOME/.fpath/

mkdir -p $HOME/.bin
link_fun $HOME/.zplugins/fasd.d/fasd $HOME/.bin/
