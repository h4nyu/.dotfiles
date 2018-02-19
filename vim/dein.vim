if &compatible
    set nocompatible 
endif

let s:dein_repo_path = '~/.vim/dein/repos/github.com/Shougo/dein.vim'

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin("~/.vim/dein")
call dein#load_toml('~/.vim/plugins.toml', {'lazy': 0})
call dein#load_toml('~/.vim/plugins_lazy.toml', {'lazy': 1})
call dein#end()
call dein#save_state()
 

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif
