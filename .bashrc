
# Source global definitions
if [ -f /etc/bashrc ]; then
       . /etc/bashrc
fi

export PATH=$PATH:$HOME/.toolbox/bin:/usr/local/bin:/Applications/MacVim.app/Contents/bin

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  echo "trying to run bash_completions"
. $(brew --prefix)/etc/bash_completion
fi

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
  source /usr/share/git-core/contrib/completion/git-prompt.sh
else
  if [ ! -f ~/.git-prompt.sh ]; then
    curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  fi
  source ~/.git-prompt.sh
fi

# Dont show flag on unstaged files in prompt (longer loading)
export GIT_PS1_SHOWDIRTYSTATE=0

# Show git branch in directory
export PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

coursera_home=/home/$USER/Projects/Private/data-manipulation-coursera
alias hw-git='git --git-dir=$coursera_home/.git/ --work-tree=$coursera_home'

alias mc='EDITOR=mvim mc'

# Midnight commander: libffi is keg-only, which means it was not symlinked into /usr/local,
# because some formulae require a newer version of libffi.
# For compilers to find libffi you may need to set:
export LDFLAGS="-L/usr/local/opt/libffi/lib"
# For pkg-config to find libffi you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# Run this to fix tilda ~ location on mac
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'

# Turns off bracketed paste mode: Fix weird paste signs when using mouse
printf "\e[?2004l"

# Show hidden files on finder
# defaults write com.apple.Finder AppleShowAllFiles true
# killall Finder

_completion_loader git; complete -o bashdefault -o default -o nospace -F _git hw-git
_completion_loader git; complete -o bashdefault -o default -o nospace -F _git config
_completion_loader git; complete -o bashdefault -o default -o nospace -F _git mc

if [ -f ~/.bash_alias ]; then
. ~/.bash_alias
fi

