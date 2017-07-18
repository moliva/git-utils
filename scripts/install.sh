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
INSTALLATION_DIR="$HOME/.git-utils"

info "cloning git utils into home"
cd "$HOME"
[[ -d "$INSTALLATION_DIR" ]] && rm -rf "$INSTALLATION_DIR"
git clone "$REPO_LOCATION" "$INSTALLATION_DIR"

cd "$INSTALLATION_DIR"

info "creating symlink git-utils/bin to /usr/local/bin"
GIT_REVIEW_BIN="$INSTALLATION_DIR/bin/git-review"
GIT_REVIEW_BIN_SYMLINK="/usr/local/bin/git-review"

[ -f "$GIT_REVIEW_BIN_SYMLINK" ] && rm "$GIT_REVIEW_BIN_SYMLINK"
ln -s "$GIT_REVIEW_BIN" "$GIT_REVIEW_BIN_SYMLINK"

success "installed git-utils"

cd "$ORIGINAL_DIR"
