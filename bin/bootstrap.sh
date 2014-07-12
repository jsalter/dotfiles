#!/usr/bin/env bash
set -e
echo "requires: git tmux fish vim"

function islink {
  test -L "$HOME/$2" || ln -s "$HOME/.dotfiles/$1" "$HOME/$2"
}

function mkpath {
  test -d "$1" || mkdir -p "$1"
}

mkpath ~/.config/fish
mkpath ~/bin
mkpath ~/src

test -d ~/.dotfiles || git clone https://jsalter@bitbucket.org/jsalter/dotfiles.git ~/.dotfiles

islink ".tmux.conf"       ".tmux.conf"
islink ".vimrc"           ".vimrc"
islink ".inputrc"         ".inputrc"
islink "fish/config.fish" ".config/fish/config.fish"
islink "fish/functions"   ".config/fish"

echo done
