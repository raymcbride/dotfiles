set nocompatible
filetype off

" setup and run vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin('$HOME/.vundle/')

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'saltstack/salt-vim'
Plugin 'taglist.vim'
Plugin 'tpope/vim-surround'
Plugin 'ruby.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'einars/js-beautify'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/undotree.vim'
Plugin 'django.vim'
Plugin 'python.vim'
Plugin 'nginx.vim'

call vundle#end() " required
set encoding=utf-8

filetype plugin on
filetype plugin indent on
syntax enable

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

