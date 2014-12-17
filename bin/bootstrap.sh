#!/usr/bin/env bash
set -e
echo "requires: git tmux fish vim"

function islink {
  test -L "$HOME/$2" || ln -s "$HOME/.dotfiles/$1" "$HOME/$2"
}

function ispath {
  test -d "$1" || mkdir -p "$1"
}

ispath ~/.config/fish
ispath ~/bin
ispath ~/src

test -d ~/.dotfiles || git clone https://jsalter@bitbucket.org/jsalter/dotfiles.git ~/.dotfiles

islink ".tmux.conf"       ".tmux.conf"
islink "vim"              ".vim"
islink "vim/vimrc"        ".vimrc"
islink ".inputrc"         ".inputrc"
islink "gitignore"        ".gitignore"
islink "fish/config.fish" ".config/fish/config.fish"
islink "fish/functions"   ".config/fish/functions"

test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -N -u ~/.dotfiles/vim/bundles.vim +PluginInstall! +qall
cd ~/.vim/bundle/YouCompleteMe
if [ "$OS" = "darwin" ]; then
  ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
elif [ "$OS" = "linux" ]; then
  ~/.vim/bundle/YouCompleteMe/install.sh
fi

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if [ -z "$(command -v reattach-to-user-namespace)" ]; then
  echo -e '#!/usr/bin/env bash\nexec "$@"' > ~/bin/reattach-to-user-namespace
  chmod +x ~/bin/reattach-to-user-namespace
fi

echo done
