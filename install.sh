#!/usr/bin/env bash

CFG_DIR="$HOME/.cfg/"
TMP_DIR="$HOME/.cfg-tmp"
REPO_URL="https://github.com/spejamchr/cfg.git"

CONFIG=config
ALIAS="/usr/bin/git --git-dir=$CFG_DIR --work-tree=$HOME"

if [ -d "$CFG_DIR" ]; then
  if [ alias | grep "$CONFIG='$ALIAS'" ]; then
    # Don't remove the directory
  else
    echo "removing directory: $CFG_DIR"
    rm -rf "$CFG_DIR"
  fi
fi

if [ ! -d "$CFG_DIR" ]; then
  git clone --separate-git-dir=$CFG_DIR $REPO_URL $TMP_DIR
  rm -r $TMP_DIR
fi

function config {
  /usr/bin/git --git-dir=$CFG_DIR --work-tree=$HOME $@
}

config pull origin master
