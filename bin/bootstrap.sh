#!/usr/bin/env bash
set -e
echo "requires: git tmux fish vim"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

function ensure_link {
  test -L "$HOME/$2" || ln -s "$HOME/.dotfiles/$1" "$HOME/$2"
}

mkdir -p ~/.config/fish
mkdir -p ~/bin
mkdir -p ~/src

test -d ~/.dotfiles || git clone https://jsalter@bitbucket.org/jsalter/dotfiles.git ~/.dotfiles

ensure_link "tmux.conf"          ".tmux.conf"
ensure_link "vim"                ".vim"
ensure_link "vim/vimrc"          ".vimrc"
ensure_link "inputrc"            ".inputrc"
ensure_link "gitignore"          ".gitignore"
ensure_link "fish/config.fish"   ".config/fish/config.fish"
ensure_link "fish/functions"     ".config/fish/functions"
if [ "$OS" = "linux" -a "$(command -v terminator)" ]; then
  ensure_link "terminator/config"  ".config/terminator/config"
fi

test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -N -u ~/.dotfiles/vim/bundles.vim +PluginInstall! +qall
cd ~/.vim/bundle/YouCompleteMe
if [ "$OS" = "darwin" ]; then
  ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
elif [ "$OS" = "linux" ]; then
  ~/.vim/bundle/YouCompleteMe/install.sh
fi
test -f ~/src/z-fish/z.fish || git clone https://github.com/roryokane/z-fish ~/src/z-fish

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo done
