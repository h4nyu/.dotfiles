" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'w0ng/vim-hybrid'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-python/python-syntax'
Plug 'airblade/vim-rooter'
Plug 'othree/html5.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'udalov/kotlin-vim'
Plug 'junegunn/vim-easy-align'
Plug 'rust-lang/rust.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'zxqfl/tabnine-vim'


let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()

