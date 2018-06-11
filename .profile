source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# set git branchename
function parse_git_dirty {
  git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "✎ " || echo "➜ "
}
function parse_git_branch {
  local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "$(parse_git_dirty)$branch"
}

PS1="\[\033[01;34m\]\W\[\033[00m\]:\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]\$ "

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cuke='cucumber `git diff --name-only features`'
alias be='bundle exec'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vi
