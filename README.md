# `dots`

Install my dotfiles

## Overview

I use [the best way to store
dotfiles](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/),
and `dots` is my shortcut setup script. It grabs [my
dotfiles](https://github.com/spejamchr/cfg) and creates the proper bare git
repo in my home directory. It overwrites `$HOME/.cfg/` and any conflicting
dotfiles, so be careful if you want to use this!

## Usage

Just pipe the shell script to bash:

```
curl -Lks https://raw.githubusercontent.com/spejamchr/dots/master/install.sh | /bin/bash
```

