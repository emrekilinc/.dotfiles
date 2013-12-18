export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PS1='\[\033[01;34m\]\W \[\033[00;34m\]\[\033[01;32m\]♦  \[\033[00m\]'

source ~/.aliases/bash
source ~/.aliases/git
source ~/.aliases/tmux

# Load my scripts
source ~/.scripts/vsp

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
