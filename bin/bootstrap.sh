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
islink "vim"              ".vim"
islink "vim/vimrc"        ".vimrc"
islink ".inputrc"         ".inputrc"
islink "fish/config.fish" ".config/fish/config.fish"
islink "fish/functions"   ".config/fish/functions"

test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -N -u ~/.dotfiles/vim/bundles.vim +PluginInstall! +qall
cd ~/.vim/bundle/YouCompleteMe
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

echo done
