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
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'


NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" NeoBundle 'Shougo/neocomplete.vim'
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'tell-k/vim-autopep8'


NeoBundle 'jiangmiao/auto-pairs'


" NeoBundle 'mopp/next-alter.vim'
" NeoBundle 'taketwo/vim-ros'
" NeoBundle 'SirVer/ultisnips'
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'vim-easy-align'
" NeoBundle 'vim-scripts/python_fold'
" NeoBundle 'Konfekt/FastFold'
" NeoBundle 'alvan/vim-closetag'
" NeoBundle 'Valloric/MatchTagAlways'
" NeoBundle 'kana/vim-submode'
" NeoBundle 'Chiel92/vim-autoformat'
" NeoBundle 'soramugi/auto-ctags.vim'
" NeoBundle 'honza/vim-snippets'
" NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'Valloric/YouCompleteMe'

NeoBundleCheck

call neobundle#end()
filetype plugin on

