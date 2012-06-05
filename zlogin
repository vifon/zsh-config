# -*- mode: shell-script -*-

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
            cowsay -n -f rms <<EOF
Opera is not free software.
Launching Emacs instead.
EOF
            echo -e '\n[1;31mSTALLMAN ERROR![0m\nPress Enter'
            read
            /usr/bin/emacs -nw
        }
        chromium()
        {
            ishygddt "`date +%Y`" 'using Google Chrome'
        }
    fi
fi

source ~/.profile
