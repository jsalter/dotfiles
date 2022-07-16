#!/usr/bin/env bash
set -e
echo "requires: git tmux fish vim cmake curl"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

function ensure_link {
  test -L "$HOME/$2" || ln -s "$HOME/src/dotfiles/$1" "$HOME/$2"
}

mkdir -p ~/.config/fish
mkdir -p ~/.config/git
mkdir -p ~/bin
mkdir -p ~/src

test -d ~/src/dotfiles || git clone https://github.com/jsalter/dotfiles.git ~/src/dotfiles

ensure_link "tmux.conf"          ".tmux.conf"
ensure_link "vim"                ".vim"
ensure_link "vim/vimrc"          ".vimrc"
ensure_link "inputrc"            ".inputrc"
ensure_link "gitignore"          ".config/git/ignore"
ensure_link "fish/config.fish"   ".config/fish/config.fish"
ensure_link "fish/functions"     ".config/fish/functions"

vim +PlugInstall +qall

FISHER_URL=https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
test -f ~/.config/fish/functions/fisher.fish || curl -sSL $FISHER_URL | fish -c "source && fisher install jorgebucaran/fisher"

fish -l -c "fisher list jethrokuan/z >/dev/null" || fish -l -c "fisher install jethrokuan/z"

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo done
