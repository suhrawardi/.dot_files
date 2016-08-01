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
function parse_rvm {
  local version=$(ruby -e "print RUBY_VERSION")
  echo "${version}"
}

PS1="\[\033[01;34m\]\W\[\033[00m\]:\[\e[1;32m\]\$(parse_rvm)\[\033[00m\]:\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]\$ "

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ct='ctags . $(bundle list --paths)'
alias cuke='cucumber `git diff --name-only features`'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vi
