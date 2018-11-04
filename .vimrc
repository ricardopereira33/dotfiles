set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'justinmk/vim-syntax-extra'      " Enhance C definitions
Plugin 'majutsushi/tagbar'              " Search for tags
Plugin 'slim-template/vim-slim.git'     " Provides syntax highlighting
Plugin 'dag/vim2hs'                     " Provide Haskell Highlighting
Plugin 'lilydjwg/colorizer'             " Gives color when color code is writen
Plugin 'junegunn/goyo.vim'              " Changes screen to clean mode
Plugin 'Raimondi/delimitMate'           " Create close bracket automatically
Plugin 'fholgado/minibufexpl.vim'
Plugin 'luochen1990/rainbow'            " Colorize the matching

let g:rainbow_active = 1

call vundle#end()
filetype plugin indent on

" Colors {{{
syntax enable
" }}}

set nocompatible

filetype plugin indent on

syntax on

set nu

set wildmenu

set showcmd

set wildmenu

set showmatch

set incsearch

set hlsearch

set autoindent

set backspace=indent,eol,start

set shiftwidth=4

set softtabstop=4

set expandtab

set visualbell

set confirm

set laststatus=2

let g:neocomplete#enable_at_startup = 1

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
