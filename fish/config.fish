function collapse; sed -e 's/  */ /g'; end
function cuts; cut -d' ' $argv; end

function ef; vim ~/.config/fish/config.fish; end
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

function ..; cd ..; end
function ...; cd ../..; end
function ....; cd ../../..; end

if [ (uname) = 'Darwin' ]
  set -gx BOXEN_HOME /opt/boxen
  set -gx PATH "/sbin"
  prepend_to_path "/sbin"
  prepend_to_path "/usr/sbin"
  prepend_to_path "/bin"
  prepend_to_path "/usr/bin"
  prepend_to_path "/usr/local/bin"
  prepend_to_path "$HOME/bin"
  prepend_to_path "$BOXEN_HOME/homebrew/sbin"
  prepend_to_path "$BOXEN_HOME/homebrew/bin"
  prepend_to_path "$BOXEN_HOME/bin"
  prepend_to_path "$BOXEN_HOME/rbenv/plugins/ruby-build/bin"
  prepend_to_path "$BOXEN_HOME/rbenv/bin"
  prepend_to_path "$HOME/.rbenv/shims"
  prepend_to_path "$HOME/.cabal/bin"
  set -gx MANPATH $BOXEN_HOME/homebrew/share/man $MANPATH
  set -gx HOMEBREW_CACHE $BOXEN_HOME/cache/homebrew
  set -gx CFLAGS "-I$BOXEN_HOME/homebrew/include"
  set -gx RBENV_ROOT $BOXEN_HOME/rbenv

  source (rbenv init -|psub)
else
  ulimit -u 2048
  prepend_to_path "$HOME/opt/bin"
  prepend_to_path "$HOME/bin"
end

set -g -x fish_greeting ''
set -g -x EDITOR vim

source ~/src/z-fish/z.fish

if test -s $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end
