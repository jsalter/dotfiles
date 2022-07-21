#!/usr/bin/env bash
set -e
echo "requires: git tmux fish vim cmake curl"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

function ensure_link {
  test -L "$HOME/$2" || ln -s "$HOME/src/dotfiles/$1" "$HOME/$2"
}

mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/git
mkdir -p ~/bin
mkdir -p ~/src

test -d ~/src/dotfiles || git clone https://github.com/jsalter/dotfiles.git ~/src/dotfiles

ensure_link "tmux.conf"            ".tmux.conf"
ensure_link "vim"                  ".vim"
ensure_link "vim/vimrc"            ".vimrc"
ensure_link "inputrc"              ".inputrc"
ensure_link "gitignore"            ".config/git/ignore"
ensure_link "fish/config.fish"     ".config/fish/config.fish"
ensure_link "hammerspoon/init.lua" ".hammerspoon/init.lua"

for x in $HOME/src/dotfiles/fish/functions/*; do
  f=$(basename $x)
  ensure_link $f ".config/fish/functions/$f"
done

vim +PlugInstall +qall

FISHER_URL=https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
test -f ~/.config/fish/functions/fisher.fish || curl -sSL $FISHER_URL | fish -c "source && fisher install jorgebucaran/fisher"

fish -l -c "fisher list jethrokuan/z >/dev/null" || fish -l -c "fisher install jethrokuan/z"

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if ! hash jsonnet 2>/dev/null; then
  echo "Jsonnet not installed. Skipping Karabiner config."
else
  jsonnet $HOME/src/dotfiles/karabiner/karabiner.jsonnet -o $HOME/src/dotfiles/karabiner/karabiner.json
  ensure_link "karabiner/karabiner.json" ".config/karabiner/karabiner.json"
fi

if [ -f $HOME/src/homebrew-brewfile/Brewfile ]; then
  test -L "$HOME/.Brewfile" || ln -sf "$HOME/src/homebrew-brewfile/Brewfile" "$HOME/.Brewfile"
  if ! hash brew 2>/dev/null; then
    echo "Homebrew not installed. Skipping 'brew bundle'."
  else
    brew update --auto-update --quiet
    env HOMEBREW_COLOR=1 brew bundle --global | grep -v ^Using
  fi
fi

echo done
