#!/usr/bin/env bash

CFG_DIR="$HOME/.cfg/"
TMP_DIR="$HOME/.cfg-tmp/"
REPO_URL="https://github.com/spejamchr/cfg.git"

if [ -d "$CFG_DIR" ]; then
  if [ "$USES_DOTS" ]; then
    echo "Leaving directory: $CFG_DIR"
  else
    echo "removing directory: $CFG_DIR"
    rm -rf "$CFG_DIR"
  fi
fi

if [ ! -d "$CFG_DIR" ]; then
  git clone --bare "$REPO_URL" "$CFG_DIR"
  mkdir "$TMP_DIR"
  git --git-dir="$CFG_DIR" --work-tree="$TMP_DIR" checkout
  cp -R "$TMP_DIR" "$HOME"
  rm -rf "$TMP_DIR"
fi

git --git-dir="$CFG_DIR" --work-tree="$HOME" pull origin master
