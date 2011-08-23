# -*- mode: shell-script -*-
case "$TTY" in
	#/dev/tty1)
		#if tmux has-session -t tty1; then tmux attach -t tty1; else tmux new-session -s tty1; fi
		#;;
	#/dev/tty3)
	#	mutt
	#	if [ "`setleds < /dev/tty3 | sed -n -e '2s/.*NumLock \([^\.]*\).*/\1/' -e '2p'`" = "wł" ]; then
	#		logout
	#	else
	#	fi
	#	;;
#	/dev/tty6)
#		cowsay -f tux "Hello!"
#		;;
esac
#logout

if [ -n "$SSH_CONNECTION" ]; then 
	HISTFILE=~/.zhistory_ssh
	DEF_HISTFILE=~/.zhistory_ssh
	PSDIR=%{$YELLOW$BOLD%}"SSH"%{$RESET%}
	PSSEP2=:
	if [[ $(echo $SSH_CLIENT | awk '{print $1}') == 192.168.1.105 ]]; then
		if [ -f ~/.zphone ]; then
			. ~/.zphone
		fi
	else
		opera()
		{
			echo -e 'Opera is not free software.\nLaunching Emacs instead.' | cowsay -n -f rms 
			echo -e '\n[1;31mSTALLMAN ERROR![0m\nPress Enter'
			read
			/usr/bin/emacs -nw
		}
#		PSHOSTCOLOR="$BOLD$YELLOW"
#		PSHOST="FBI#44852"
#		PSUSERCOLOR="$BOLD$CYAN"
#		PSUSER="john"
#		PS1='\
#%{$PSUSERCOLOR%}\
#$PSUSER\
#%{$RESET%}\
#$PSSEP1\
#%{$PSHOSTCOLOR%}\
#$PSHOST\
#%{$RESET%}\
#$PSSEP2\
#:%~\
#%# '
#		RPS1=""

	fi
fi 

