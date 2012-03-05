# -*- mode: shell-script -*-
# vim: set fdm=marker :
[ -z "$PS1" ] && return
# Lines configured by zsh-newuser-install
unsetopt autocd beep
bindkey -e
if [ -d ~/.bin -a -z "`echo $PATH | grep '/home/vifon/\.bin'`" ]; then
    export PATH=~/.bin:"${PATH}"
fi
#export PATH=/usr/lib/cw:"${PATH}"

# {{{ Optymalizacja
# if [ "$PS1" ] ; then
# mkdir -m 0700 /dev/cgroup/cpu/user/$$
# echo $$ > /dev/cgroup/cpu/user/$$/tasks
# fi
# }}}

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
autoload -U colors && colors
compinit
# End of lines added by compinstall

autoload zmv

# {{{ HISTORY

#if [ -n "$SSH_CONNECTION" ]; then
#       HISTFILE=~/.zhistory_ssh
#       DEF_HISTFILE=~/.zhistory_ssh
#       PSDIR=%{$YELLOW$BOLD%}"SSH"%{$RESET%}
#       PSSEP2=:
#else
#if [ -e ~/.priv ]; then
#HISTFILE=/dev/null
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}& "
#else
HISTFILE=~/.zhistory
DEF_HISTFILE=~/.zhistory
#fi
#fi
HISTSIZE=2500
SAVEHIST=2500

# }}}
WORDCHARS='*?_-.[]~!#$%(){}<>'


PLUGINS_DIR=~/.zplugins
PLUGINS=(
    zcolors
    zremap
    zcompletion
    zaliases
    zscripts
    dirmaster
    ztodo
    zpriv
    zSSH
    amount
    zXephyr
    zmancolor
    acoc
    autojump
    valgrind-color
    ignore
    zCMake
    zsuspend
    humble
    )
if [ -f ~/.zloader ]; then
    . ~/.zloader
fi

if [ $TERM = "vt100" -o $TERM = "dumb" ]; then
    PSFILE=.zpromptlegacy.zsh
elif [ -z "$PSFILE" ]; then
    PSFILE=.zprompt
    #PSFILE=.exprompt.zsh
fi
if [ -f ~/$PSFILE ]; then
    . ~/$PSFILE
fi

if [ $TERM = "eterm-color" ]; then
    unset HISTFILE
fi

# {{{ ENV VARS AND OPTIONS
#export EDITOR="emacsclient"
export EDITOR="vim"
export ALTERNATE_EDITOR="vim"
export SUDO_EDITOR="emacsclient -c -a vim"
export BROWSER="luakit -n"
export PAGER="less"
export DROPBOXID=139016
export ACRONYMDB="/usr/share/misc/acronyms /usr/share/misc/acronyms.comp $HOME/.lib/acronyms"
#if [ -d ~/.fpath ]; then
#   fpath=(~/.fpath $fpath)
#   autoload -U ~/.fpath/*(:t)
#fi
# /usr/local/share/zsh/site-functions
setopt  hist_ignore_all_dups    \
    hist_ignore_space           \
    hist_reduce_blanks          \
    append_history              \
    share_history               \
    inc_append_history          \
    hist_no_functions           \
    extended_history            \
    hist_no_store               \
    interactivecomments         \
    \
    extended_glob               \
    braceccl                    \
    longlistjobs                \
    \
    prompt_subst                \
    \
    pushd_to_home

# }}}
