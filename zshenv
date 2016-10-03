# -*- mode: shell-script -*-
# vim: set fdm=marker :
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"

export PATH="$HOME/.cask/bin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"

export PATH="$HOME/.node_modules/node_modules/.bin:$PATH"

export PERL_MB_OPT="--install_base $HOME/.perl5"
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"
typeset -T PERL5LIB perl5lib
export PERL5LIB="$HOME/.perl5/lib/perl5/x86_64-linux-gnu-thread-multi:$HOME/.perl5/lib/perl5"
export PATH="$HOME/.perl5/bin:$PATH"

[ -e ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc

typeset -T PYTHONPATH pythonpath
export PYTHONPATH="$HOME/.local/lib/python3:$HOME/.local/lib/python3/site-packages:$PYTHONPATH"

export PATH="$HOME/.gem/ruby/2.1.0/bin:$PATH"

typeset -T C_INCLUDE_PATH c_include_path
typeset -T CPLUS_INCLUDE_PATH cplus_include_path
typeset -T LIBRARY_PATH library_path
typeset -T LD_LIBRARY_PATH ld_library_path

export PATH="$HOME/.local/bin:$PATH"

# ~/local package paths
export PATH="$HOME/local/bin:$PATH"

# Note: The array syntax is used to avoid prepending to an empty list.
# It would add a trailing colon, which effectively works as ".", which
# in turn breaks for example Perlbrew.
c_include_path+=("$HOME/local/include" $c_include_path)
cplus_include_path+=("$HOME/local/include" $cplus_include_path)
library_path+=("$HOME/local/lib" $library_path)
ld_library_path+=("$HOME/local/lib" $ld_library_path)
export PYTHONPATH="$HOME/local/lib/python3.4/site-packages:$HOME/local/lib/python2.7/site-packages:$PYTHONPATH"

# ~/local-my custom paths
c_include_path+=("$HOME/local-my/include" $c_include_path)
cplus_include_path+=("$HOME/local-my/include" $cplus_include_path)
library_path+=("$home/local-my/lib" $library_path)
ld_library_path+=("$HOME/local-my/lib" $ld_library_path)
export PYTHONPATH="$HOME/local-my/lib/python:$PYTHONPATH"

FPATH=$HOME/.fpath:$FPATH

export PATH="$HOME/.bin:$PATH"

# Load Nix environment.
[ -e ~/.nix-profile/etc/profile.d/nix.sh ] && source ~/.nix-profile/etc/profile.d/nix.sh

typeset -U PATH PYTHONPATH PERL5LIB C_INCLUDE_PATH CPLUS_INCLUDE_PATH LIBRARY_PATH LD_LIBRARY_PATH FPATH

export MANPATH=":$HOME/local/share/man"

export ACRONYMDB="$HOME/.resources/acronyms"
export RLWRAP_HOME="$HOME/.rlwrap"

export P4CONFIG=".p4config"
export P4MERGE="m4merge"

if [ -e ~/.config/ranger/rc.conf ]; then
    export RANGER_LOAD_DEFAULT_RC=FALSE
fi
