set nocompatible

set history=256                    " remember n commands
set hidden                         " switch buffers without saving

" formatting
set formatoptions-=r               " don't autoinsert comment leader after enter
set backspace=indent,eol,start
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" appearance
syntax on
set background=light
set laststatus=2                   " show status line always
set list                           " display unprintable characters
set listchars=tab:\ \ ,trail:·     " show tabs and trailing spaces

" http://github.com/gmarik/vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
colorscheme solarized
Bundle 'bling/vim-airline'
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

filetype plugin indent on          " load filetype plugin and indent files

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
