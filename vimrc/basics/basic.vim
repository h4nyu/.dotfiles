
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
set foldmethod=indent   
set foldnestmax=11
set nofoldenable
set foldlevel=2
set foldcolumn=3
set path+=/opt/ros/indigo/include
set path+=/opt/ros/jade/include
set path+=/usr/include
set path+=/usr/local/include
"
"
"
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
au BufRead,BufNewFile *.{toml} set filetype=vim
au BufRead,BufNewFile *.{text} set filetype=markdown
au BufRead,BufNewFile *.{puml} set filetype=plantuml


"--------------------------
" highlight
"--------------------------

" QuickfixCmdPost
au QuickfixCmdPost make,grep,grepadd,vimgrep copen


if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

