#!/usr/bin/env bash

if [ "$USES_DOTS" ]; then
  function config {
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
  }

  # Remove all tracked files
  rm $(config ls-tree -r master --name-only)

  # Remove all empty directories
  DS=$(config ls-tree -r master --name-only -d)
  rm -r $(echo "$DS" | perl -e 'print sort { length($b) <=> length($a) } <>')

  rm -rf "$HOME/.cfg"
else
  echo "You're not using dots; there's nothing to do!"
fi

