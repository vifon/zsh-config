# -*- mode: shell-script -*-
# vim: set fdm=marker :
[ -z "$PS1" ] && return
unsetopt autocd beep
bindkey -e

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
autoload -U colors && colors
compinit
# End of lines added by compinstall

(( $+commands[lesspipe] )) && eval `lesspipe`

autoload zmv zed
autoload -U insert-files && zle -N insert-files && bindkey '^X^F' insert-files

autoload run-help
HELPDIR=$HOME/.zsh-help
alias run-help=' run-help'

HISTFILE=~/.zhistory
DEF_HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

WORDCHARS='*?_-.[]~!#$%(){}<>'

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\n\ncpu\t%P\ntotal\t%*E'

if (( $+commands[e] )); then
    export EDITOR=e # Emacs wrapper necessary because of the broken word splitting in some programs
else
    export EDITOR=vim
fi
export ALTERNATE_EDITOR="vim"
export SUDO_EDITOR="$HOME/local/bin/emacsclient -c -a vim"
export BROWSER="chromium"
export PAGER="less"
export TERMCMD="urxvtcd"
setopt hist_ignore_all_dups     \
    hist_ignore_space           \
    hist_reduce_blanks          \
    append_history              \
    share_history               \
    inc_append_history          \
    hist_no_functions           \
    extended_history            \
    hist_no_store               \
    interactivecomments         \
    auto_cd                     \
    rc_quotes                   \
    \
    extended_glob               \
    magicequalsubst             \
    longlistjobs                \
    \
    prompt_subst                \
    \
    pushd_to_home               \
    local_options


PLUGINS_DIR=~/.zplugins
PLUGINS=(
    zcolors
    zle-config
    zaliases
    zcompletion
    zscripts
    zpriv
    zXephyr
    zmancolor
    filehandlers
    functional
    urxvt_cwd-spawn
    term-title
    zsh-image-extension
    perl-edit
    fasd
    scratchdir
    zlocalenv
    my-fixes
    zcapture
    ignore
    deer
    zranger
    localhistory
    ztodo
    fzf
    texas
    )
if [ -f ~/.zloader ]; then
    . ~/.zloader
fi

if [ $TERM = "vt100" -o $TERM = "dumb" ]; then
    PSFILE=.zpromptlegacy.zsh
elif [ -z "$PSFILE" ]; then
    PSFILE=.zprompt
fi
if [ -f ~/$PSFILE ]; then
    . ~/$PSFILE
fi

if [ -f ~/.sdk.env ]; then
    . ~/.sdk.env
fi

if [ $TERM = "eterm-color" -o -n "$MC_TMPDIR" ]; then
    unset HISTFILE
    fc -R $DEF_HISTFILE

    eval "$(dircolors -b)"
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

    RPS1=""
fi

if [ -n "$CLEARONSTART" ]; then
    clear
    unset CLEARONSTART
fi

if [ -n "$RANGER_LEVEL" ]; then
    trap "pwd > /tmp/rangershelldir" EXIT
fi
