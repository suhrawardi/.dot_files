# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

source ~/.dot_files/git-prompt.sh

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.dot_files/bin" ] ; then
  PATH="$HOME/.dot_files/bin:$PATH"
fi

# set git branchename
function parse_git_dirty {
  git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "✎ " || echo "➜ "
}
function parse_git_branch {
  local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "$(parse_git_dirty)$branch"
}

if [ -d "$HOME/.asdf" ] ; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

PS1="\[\033[01;34m\]\W\[\033[00m\]:\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]\$ "

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dc='docker-compose'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vi

export BASH_SILENCE_DEPRECATION_WARNING=1

# eval $(docker-machine env default)
source "$HOME/.cargo/env"
