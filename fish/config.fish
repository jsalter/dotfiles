function collapse; sed -e 's/  */ /g'; end
function cuts; cut -d' ' $argv; end

function eb; vim ~/.Brewfile; end
function ef; vim ~/.config/fish/config.fish; end
function ep; vim ~/.ipython/profile_default/ipython_config.py; end
function es; vim ~/.ssh/config; end
function et; vim ~/.tmux.conf; end
function ev; vim ~/.vimrc; end

function psg -d "Greps for a running process, returning its PID and full string"
    ps auxww | grep -i --color=always $argv | grep -v grep | collapse | cuts -f 2,11-
end

function cuts -d "Removes space-delimited sections from each line of files"
  cut -d' ' $argv
end

function prepend_to_path -d "Prepends given dir to PATH if it exists and is not already in PATH"
  if test -d $argv[1]
    if not contains $argv[1] $PATH
      set -gx PATH "$argv[1]" $PATH
    end
  end
end

function append_to_path -d "Appends given dir to PATH if it exists and is not already in PATH"
  if test -d $argv[1]
    if not contains $argv[1] $PATH
      set -gx PATH $PATH "$argv[1]"
    end
  end
end

function ..; cd ..; end
function ...; cd ../..; end
function ....; cd ../../..; end
function mkd; mkdir -p $argv && cd $argv; end

if [ (uname) = 'Darwin' ]
  set -gx PATH "/sbin"
  prepend_to_path "/sbin"
  prepend_to_path "/usr/sbin"
  prepend_to_path "/bin"
  prepend_to_path "/usr/bin"
  prepend_to_path "/usr/local/bin"
  prepend_to_path "/opt/homebrew/bin"
  prepend_to_path "$HOME/.local/bin"
  prepend_to_path "$HOME/bin"
else
  ulimit -u 2048
  prepend_to_path "$HOME/opt/bin"
  prepend_to_path "$HOME/bin"
end

set -g -x fish_greeting ''
set -g -x EDITOR vim

if test -s $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end
