" Separate Vundle configuration file to fix errors when installing
" bundles for the first time.
" http://gmarik.info/blog/2011/05/17/chicken-or-egg-dilemma
set nocompatible

" http://github.com/gmarik/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'wting/rust.vim'
Plugin 'vim-pandoc/vim-pantondoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'plasticboy/vim-markdown'
Plugin 'pgdouyon/vimroom'
Plugin 'majutsushi/tagbar'

" Color schemes
Plugin 'altercation/vim-colors-solarized'

" Required, plugins available after
call vundle#end()
filetype plugin indent on          " load filetype plugin and indent files

