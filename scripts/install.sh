#!/bin/bash

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

ORIGINAL_DIR=$(pwd -P)

REPO_LOCATION=https://github.com/moliva/git-utils.git
DOTFILES=$HOME/.git-utils

info "cloning git utils into home"
cd $HOME
git clone $REPO_LOCATION $DOTFILES
cd $DOTFILES

info "creating symlink git-utils/bin to /usr/local/bin"
ln -s $DOTFILES/bin/git-review /usr/local/bin/git-review

success "installed git-utils"

cd $ORIGINAL_DIR
