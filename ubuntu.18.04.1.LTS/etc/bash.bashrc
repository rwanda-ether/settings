# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *|*\ sudo\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

#------------------- ADD BY T.H -------------------
#
# Colored file listings
#
if test -x /usr/bin/dircolors ; then
    #
    # set up the color-ls environment variables:
    #
    if test -f $HOME/.dir_colors ; then
        eval `dircolors -b $HOME/.dir_colors`
    elif test -f /etc/DIR_COLORS ; then
        eval `dircolors -b /etc/DIR_COLORS`
    fi
fi

alias cleandemofiles='rm -rf *.c *.vhd ISE_PROJECT *~ .*~ *.h'
alias ssh-set='eval `ssh-agent`; ssh-add'
alias suu='sudo su '
alias ss='ssh -C -X -l `whoami`'
alias langj='export LANG=ja_JP.eucJP'
alias langc='export LANG=C'
alias cd='pushd ./ 1>/dev/null 2>/dev/null;echo $PWD;cd $ARG'
alias bk='dirs +2;popd 1>/dev/null 2>/dev/null;' 
alias er='rm -r *~'
alias err='rm -r .*~'
alias mule='emacs' 
alias cls='clear'
alias l='emacs -nw'
alias ls='ls -F --color=tty'
alias la='ls -la --color=tty'
alias ll='ls -l --color=tty'
alias less='less -X'
alias sch='source ~/.bashrc; echo .bashrc'
alias kterm='kterm -fg wheat -bg black -km euc -sl 2000'
alias xterm='xterm -bg "#001f33" -fg "#FFF0F0"'
alias setx='xsetroot -mod 2 2 -fg "#003322" -bg "#003322"'

alias amek='make'
alias amke='make'
alias mkae='make'
alias mkea='make'
alias maek='make'
alias muel='mule'
alias moer='more'
alias mroe='more'
alias mre='more'
alias meor='more'
alias sl='ls'

alias g='geth attach ~/.ethereum/testnet/geth.ipc'

umask 022
export LANG=C

export JLESSCHARSET=japanese
export LESSOPEN="|lesspipe.sh %s"

# Anaconda3
export PATH="$HOME/anaconda3/bin:$PATH"

# CUDA
export PATH=$PATH:/usr/local/cuda/bin

# General
export PATH=$PATH:~/bin
