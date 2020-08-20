set diffopt+=vertical
set noswapfile
set nocompatible
set number
set title
set hidden
set showcmd
set autoindent
set smartindent
set ruler
set laststatus=2
set mouse=a
set encoding=utf-8
set wildmenu
set incsearch
set cmdheight=1
set nowritebackup
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set completeopt=menuone
set foldmethod=indent   
set foldnestmax=11
set nofoldenable
set foldlevel=2
set foldcolumn=3
set path+=/opt/ros/indigo/include
set path+=/opt/ros/jade/include
set path+=/usr/include
set path+=/usr/local/include
set tags=./tags;
set autoread
au CursorHold * checktime

let mapleader = "\<Space>"

set background=dark
set t_Co=256

let loaded_matchparen = 1
hi MatchParen ctermbg=1

au QuickfixCmdPost make,grep,grepadd,vimgrep copen
