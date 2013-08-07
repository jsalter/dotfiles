set nocompatible

set history=256
set hidden          " switch buffers without saving

" http://github.com/gmarik/vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'

set formatoptions-=r

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

syntax on
set background=light
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
set laststatus=2
set backspace=indent,eol,start

" visible tabs and trailing spaces
set list listchars=tab:\ \ ,trail:·

filetype plugin indent on
