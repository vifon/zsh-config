# -*- sh -*-
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"

# Load Nix environment.
[ -e ~/.nix-profile/etc/profile.d/nix.sh ] && source ~/.nix-profile/etc/profile.d/nix.sh
[ -d /usr/share/terminfo ] && export TERMINFO=/usr/share/terminfo

# Various alternative package managers.
export PATH="$HOME/.cask/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH="$HOME/.gopath/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
export PATH="$HOME/perl5/bin:$PATH"

# A handy array-like access to these variables.
typeset -T C_INCLUDE_PATH c_include_path
typeset -T CPLUS_INCLUDE_PATH cplus_include_path
typeset -T LIBRARY_PATH library_path
typeset -T LD_LIBRARY_PATH ld_library_path
typeset -T PYTHONPATH pythonpath

export PYTHONPATH

# Note: The array syntax is used to avoid prepending to an empty list.
# It would add a trailing colon, which effectively works as ".", which
# in turn breaks for example Perlbrew.
c_include_path+=("$HOME/local/include" $c_include_path)
cplus_include_path+=("$HOME/local/include" $cplus_include_path)
library_path+=("$HOME/local/lib" $library_path)
ld_library_path+=("$HOME/local/lib" $ld_library_path)
pythonpath+=($HOME/local/lib{64,}/python*/site-packages(N) $pythonpath)


# Personal bin directories.
export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.ssh/bin"

export MANPATH="$HOME/local/share/man:"

# Remove the duplicate entries.
typeset -U PATH PYTHONPATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH LIBRARY_PATH LD_LIBRARY_PATH FPATH


if (( $+commands[e] && $+commands[emacsclient] )) ; then
    export EDITOR=e # Emacs wrapper necessary because of the broken word splitting in some programs
else
    export EDITOR=vim
fi
export VISUAL=$EDITOR
export ALTERNATE_EDITOR="vim"
if [ -x /usr/bin/emacsclient ]; then
    export SUDO_EDITOR="/usr/bin/emacsclient -c -a vim"
else
    export SUDO_EDITOR="vim"
fi
export PAGER="less"
export TERMCMD="urxvtcd"
export DVTM_EDITOR="less"


# Program-specific.
export ACRONYMDB="$HOME/.resources/acronyms"
export RLWRAP_HOME="$HOME/.rlwrap"

# Perforce/P4
export P4CONFIG=".p4config"
export P4MERGE="m4merge"

# SDK-specific settings.
if [ -f ~/.sdk.env ]; then
    . ~/.sdk.env
fi

if [ -n "$SSH_TTY" ]; then
    export GPG_TTY=$SSH_TTY
fi
