# -*- mode: shell-script -*-
case "$TTY" in
	/dev/tty1)
		if tmux has-session -t tty1; then tmux attach -t tty1; else tmux new-session -s tty1; fi
		;;
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
	fi
fi 

