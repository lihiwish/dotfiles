# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

vssh ()
{ 
	VM=$1;
	if [ -z "$2" ]; then
		vagrant ssh $VM -p -- -l stack -X
	else
		host_ip=$(vagrant ssh-config $VM | awk '$1 ~ /^HostName/' | awk '{print $2}')
		vagrant ssh $VM -p -- -l stack -X -L $2:$host_ip:80
	fi
}

# Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

# Dont show flag on unstaged files in prompt (longer loading)
export GIT_PS1_SHOWDIRTYSTATE=0

# Show git branch in directory
export PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias config='/usr/bin/git --git-dir=~/.cfg/ --work-tree=~'
