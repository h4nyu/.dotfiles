if has('vim_starting') 
    set nocompatible 
    if !isdirectory(expand("~/.vim/bundle/dein.vim/")) 
        echo "install dein..." 
        :call system("git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/dein.vim")
    endif 
    set runtimepath+=~/.vim/bundle/dein.vim/
endif



if dein#load_state('~/.vim/bundle/dein.vim/')
  call dein#begin('~/.vim/bundle/dein.vim/')
  call dein#add('Shougo/dein.vim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
