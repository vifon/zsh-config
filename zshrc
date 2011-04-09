# vim: set fdm=marker :
# {{{ before plugins
[ -z "$PS1" ] && return
# Lines configured by zsh-newuser-install
unsetopt autocd beep
bindkey -e

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

if [ -f ~/.zremap.zsh ]; then
	. ~/.zremap.zsh
fi
# {{{ HISTORY
#if [ -n "$SSH_CONNECTION" ]; then
#		HISTFILE=~/.zhistory_ssh
#		DEF_HISTFILE=~/.zhistory_ssh
#		PSDIR=%{$YELLOW$BOLD%}"SSH"%{$RESET%}
#		PSSEP2=:
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

# }}}
PLUGINS=(\
	.zplugins/zcolors\
	.zplugins/zremap.zsh\
	.zplugins/zcompletion\
	.zplugins/zaliases\
	.zplugins/zscripts.zsh\
	.zplugins/dirmaster\
	.zplugins/ztodo\
	.zplugins/zpriv\
	.zplugins/zSSH\
	)
# {{{ after plugins
for (( i = 1 ; i <= ${#PLUGINS[@]} ; i++ )); do
	if [ -f ~/$PLUGINS[$i] ]; then
		. ~/$PLUGINS[$i]
		if [ -n "$DEBUG" -o "$TTY[6,8]" = "tty" ]; then
			echo "$GREEN$BOLD*$RESET $PLUGINS[$i] loaded"
		fi
	else
		if [ -n "$DEBUG" -o "$TTY[6,8]" = "tty" ]; then
			echo "$RED$BOLD*$RESET $PLUGINS[$i] not loaded"
		fi
	fi
done
unset i

if [ $TERM = "vt100" -o $TERM = "dumb" ]; then
	PSFILE=.zpromptlegacy.zsh
elif [ -z "$PSFILE" ]; then
	PSFILE=.zprompt
	#PSFILE=.exprompt.zsh
fi
if [ -f ~/$PSFILE ]; then
	. ~/$PSFILE
fi

# {{{ ENV VARS AND OPTIONS
export EDITOR="vim"
export BROWSER="opera"
export PAGER="less"
export DROPBOXID=139016
if [ -d ~/.bin ]; then
	export PATH=~/.bin:"${PATH}"
fi
#if [ -d ~/.fpath ]; then
#	fpath=(~/.fpath $fpath)
#	autoload -U ~/.fpath/*(:t)
#fi
# /usr/local/share/zsh/site-functions
setopt	hist_ignore_all_dups	\
	hist_ignore_space			\
	hist_reduce_blanks			\
	append_history				\
	share_history				\
	inc_append_history			\
	hist_no_functions			\
	extended_history			\
	hist_no_store				\
	\
	extended_glob				\
	braceccl					\
	longlistjobs				\
	\
	prompt_subst
# }}}

# }}}
