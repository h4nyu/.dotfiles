"Neoboundle
if has('vim_starting') 
    set nocompatible 
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/")) 
        echo "install neobundle..." 
        :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif 
    set runtimepath+=~/.vim/bundle/neobundle.vim/ 
endif

call neobundle#begin(expand('~/.vim/bundle')) 
let g:neobundle_default_git_protocol='https' 
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tell-k/vim-autopep8'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-build'
NeoBundle 'vim-easy-align'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'kana/vim-submode'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/python_fold'
NeoBundle 'Konfekt/FastFold'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'alvan/vim-closetag'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle "taketwo/vim-ros"
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Rip-Rip/clang_complete'

NeoBundleCheck

call neobundle#end()
filetype plugin on


