syntax on

set diffopt+=vertical
set tags+=.git/tags 
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
set clipboard=unnamed,autoselect
set mouse=a
set ttymouse=xterm2
set encoding=utf-8
set wildmenu
set incsearch
set cmdheight=1
set t_Co=256
set nowritebackup
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set completeopt=menuone
set background=dark
set foldmethod=syntax 
set foldlevel=2
set foldcolumn=3
set path+=/opt/ros/indigo/include
set path+=/opt/ros/jade/include
set path+=/usr/include
set path+=/usr/include/boost



if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
endif

"-------------------------
"  filetype
"--------------------------
filetype indent on
au BufRead,BufNewFile *.{conf,launch,config,sdf,xacro,gazebo,urdf} set filetype=xml
au BufRead,BufNewFile *.{text} set filetype=markdown


"--------------------------
" highlight
"--------------------------
colorscheme hybrid 
" let loaded_matchparen = 1
hi MatchParen ctermfg=gray ctermbg=22
