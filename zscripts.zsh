# vim: set fdm=marker :
mkcd()
{
	mkdir -p "$*"
	cd "$*"
}

tree()
{
	ls -R $* | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}

moc() # {{{
{
	mocp $*
	if [ -z $1 ]; then
		clear
		if [ -n "$STY" ]; then
			screen -X title "zsh" 
		elif [ -z "$TMUX" ]; then
			echo -en "]2;Terminal"
		fi
	fi
}
if [ -n "$PHONE" ]; then
	alias moc='moc --config ~/.moc/phone_config'
fi
# }}}

vbeep()
{
	yes "$*" > /dev/audio
}

# {{{ cp_p
#cp_p()
#{
#	pv -per $1 > $2
#}

#cp_p()
#{
#   strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
#      | awk '{
#        count += $NF
#            if (count % 10 == 0) {
#               percent = count / total_size * 100
#               printf "%3d%% [", percent
#               for (i=0;i<=percent;i++)
#                  printf "="
#               printf ">"
#               for (i=percent;i<100;i++)
#                  printf " "
#               printf "]\r"
#            }
#         }
#         END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
#}
# }}}

# {{{ WIN-BOOT
#win-boot()
#{
#	sudo grub-reboot "Microsoft Windows XP Professional (on /dev/sda3)"
#	sudo init 6
#}
# }}}
# {{{ connect
#connect()
#{
#	wicd-cli --wireless --scan
#	wicd-cli --wireless -n `wicd-cli --wireless --list-networks | grep -E "\bVifon's Network\b|\bKFC\b|\bWEiTI\b" | sed 's/\([0-9]*\).*/\1/'` -c
#}
# }}}

# {{{ CPU
#cpu()
#{
#	case "$1" in
#		b)
#			cpufreq-selector -c 0 -g powersave
#			cpufreq-selector -c 1 -g powersave
#			echo CPU governor set to: POWERSAVE
#			;;
#		d)
#			cpufreq-selector -c 0 -g ondemand
#			cpufreq-selector -c 1 -g ondemand
#			echo CPU governor set to: ONDEMAND
#			;;
#		p)
#			cpufreq-selector -c 0 -g performance
#			cpufreq-selector -c 1 -g performance
#			echo CPU governor set to: PERFORMANCE
#			;;
#		*)
#			#cat /proc/cpuinfo | grep -m 1 MHz | sed 's/.*: \(.*\)\..*/\1 MHz/'
#			echo current governor: `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor | awk '{print toupper($1)}'`
#			echo frequencies:
#			cat /proc/cpuinfo | grep MHz | sed 's/.*: \(.*\)\..*/		\1 MHz/'
#			;;
#	esac
#}
#compctl -k "(d b p)" cpu
# }}}

wprefix()
{
	export WINEPREFIX="$HOME/$1/"
}

man2pdf()
{
	man -t $1 | ps2pdf - > $2
}

#acpic()
#{
#	acpi | sed "s#\\([0-9]\\{1,3\\}%\\)\\([^0-9]\+\\)\\([0-9]*[^:]:[0-9]\\{2\\}\\):#`tput setaf 1``tput bold`\\1`tput sgr0`\\2`tput setaf 6``tput bold`\\3`tput sgr0`:#"
#}
#alias acpi='acpi-c'

priv()
{
	if [ ! "$HISTFILE" = "/dev/null" -o -n "$1" ]; then
		HISTFILE=/dev/null
		#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}& "
		export PRIV_MARKER="$PR_SHIFT_IN$PSSEPARATOR$PR_SHIFT_OUT($RED$BOLD"PRIV"$RESET)"
		#RPS1="%B%F{red}${PRIV_MARKER}%F{yellow}${SSH_MARKER}%b%F{reset}"
	else
		privoff
	fi
}

killwatch()
{
	if [ -z "$2" ]; then
		2=5;
	fi
	while [ true ]; do
		killall $1 2> /dev/null
		sleep $2
	done
}

listcolors()
{
	local COLORS
	COLORS=(RED GREEN YELLOW BLUE MAGENTA CYAN WHITE)
	for i in {1..7}; do
		echo $i: `tput setaf $i`$COLORS[$i] `tput bold`$COLORS[$i]`tput sgr0`
	done
}

listargs()
{
	local i
	for i in {1..$#}; do
		echo $argv[i]
	done
}

cutline()
{
	head -n $2 $1 | tail -n 1
}

xephyr()
{
	if [ -z "$1" ]; then
		1=1
	fi
	if [ -z "$2" ]; then
		2=800x600
	fi
	Xephyr :$1 -screen $2 2> /dev/null &
	sleep 1
	export DISPLAY=:$1
	openbox 2> /dev/null &
}

amount()
{
	pmount "$1" 2> /dev/null
	if [ $? = 0 ]; then
		echo "$BOLD$GREEN*$RESET $1 mounted"
		zsh
		pumount "$1" 2> /dev/null
		if [ $? = 0 ]; then
			echo "$BOLD$GREEN*$RESET $1 unmounted"
		else
			echo "$BOLD$RED*$RESET Cannot unmount $1"
		fi
	else
		echo "$BOLD$RED*$RESET Cannot mount $1"
	fi
}

# {{{ priv
privon()
{
	if [ -e ~/.priv ]; then
		echo "Already in priv-mode!"
	else
		cp -v ~/.recently-used.xbel{,1}
		cp -v ~/.viminfo{,1}
		cp -v ~/.vim_mru_files{,1}
		touch ~/.priv
		priv 1
		echo "Priv-mode activated"
	fi
}

privoff()
{
	if [ ! -e ~/.priv ]; then
		if [ "$HISTFILE" = "$DEF_HISTFILE" ]; then
			echo "Not in priv-mode!"
		fi
	else
		mv -v ~/.recently-used.xbel{1,}
		mv -v ~/.viminfo{1,}
		mv -v ~/.vim_mru_files{1,}
		rm ~/.priv
		echo "Priv-mode deactivated"
	fi
	HISTFILE=$DEF_HISTFILE
	#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}%# "
	PRIV_MARKER=
	#RPS1="%B%F{red}${PRIV_MARKER}%F{yellow}${SSH_MARKER}%b%F{reset}"
}
# }}}
# {{{ todo
#todoadd()
#{
#	cat >> ~/todo
#	sed -i '/^$/d' ~/todo
#	sort ~/todo -o ~/todo
#}
#todols()
#{
#	cat ~/todo
#}
#todorm()
#{
#	cat -n ~/todo
#	echo ------------------------------
#	sed -i "`cat`" ~/todo
#}
# }}}
# {{{ SSH
MYKEY='1b:97:f1:43:86:01:00:58:de:85:18:d3:31:07:18:86'
ssha()
{
	eval `ssh-attach.sh` > /dev/null
	export SSH_AGENT_PID=$(pgrep ssh-agent | head -n 1)
	SSH_MARKER="$PR_SHIFT_IN$PSSEPARATOR$PR_SHIFT_OUT($MAGENTA$BOLD"SSH"$RESET)"
	if [[ -z "$(ssh-add -l 2> /dev/null | grep "$MYKEY")" ]]; then
		ssh-add
	fi
	if [[ -n "$(ssh-add -l 2> /dev/null | grep "$MYKEY")" ]]; then
		SSH_MARKER="$PR_SHIFT_IN$PSSEPARATOR$PR_SHIFT_OUT($YELLOW$BOLD"SSH"$RESET)"
	fi
}

sshad()
{
	if [ -n "$SSH_AGENT_PID" ]; then
		ssh-add -D
		eval `ssh-agent -k` > /dev/null
		unset SSH_AGENT_PID
		unset SSH_AUTH_SOCK
	else
		if [ -z "$(pgrep ssh-agent)" ]; then
			echo "No ssh-agent attached!"
		else
			ssha
			sshad
		fi
	fi
	SSH_MARKER=
}

sshadetach()
{
	unset SSH_AGENT_PID
	unset SSH_AUTH_SOCK
	SSH_MARKER="$PR_SHIFT_IN$PSSEPARATOR$PR_SHIFT_OUT($YELLOW"ssh"$RESET)"
}

sshauto()
{
	local KEYSTATE=$(ssh-add -l 2> /dev/null | grep $MYKEY)
	if [ -z "$KEYSTATE" ]; then
		if [ -n "$SSH_AGENT_PID" ]; then
			sshad &> /dev/null
		fi
		if [ -z "$(pgrep ssh-agent)" ]; then
			pamusb-check -q --service=ssh-agent_vfn vifon
			if [ "$?" = "0" ]; then
				expect <(sudo cat /root/sshattach.exp)
				ssha
			else
				echo \
					"$GREEN$BOLD*$RESET Authentication request for user \"$USER\" (ssh-agent_vfn)
$RED$BOLD*$RESET Access denied."
			fi
		else
			ssha
		fi
	fi
}
# }}}
