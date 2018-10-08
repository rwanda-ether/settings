# .bashrc
# Time-stamp: "2017-06-16 00:14:24 hamada"

# User specific aliases and functions
#shopt -s huponexit

# Source global definitions
#if [ -f /etc/bash.bashrc ]
#then
#	. /etc/bash.bashrc
#fi

if [ -f /etc/bashrc ]
then
	. /etc/bashrc
fi

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
alias ssj='ssh -C -X -l xu30 xd1gate.cray.co.jp'
alias ssc='ssh -C -X -l hhd096 xd1'
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

umask 022
export LANG=C

export JLESSCHARSET=japanese
export LESSOPEN="|lesspipe.sh %s"

