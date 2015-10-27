if has("syntax")
      syntax on
endif

set nocompatible
set number
set title
set tabstop=4
set shiftwidth=4
set smarttab
set hidden
set showcmd
set autoindent
set ruler
set laststatus=2
set clipboard=unnamed,autoselect
set clipboard=unnamedplus
set mouse=a
set ttymouse=xterm2
set encoding=utf-8
set laststatus=2
set wildmenu
set incsearch
set cmdheight=2
set t_Co=256



if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal! g'\"" |
				\ endif
endif




"Neoboundle
if has('vim_starting')
	set nocompatible
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install neobundle..."
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'
NeoBundleFetch 'Shougo/neobundle.vim'

"vimproc
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }

"colorscheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'

"UI
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itchyny/lightline.vim'

"markdown
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-markdown'

"filer
NeoBundle 'scrooloose/nerdtree'

"scrip 
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Townk/vim-autoclose'

"edit tool
NeoBundle 'vim-easy-align'
NeoBundle 'Shougo/neocomplcache'

NeoBundleCheck
call neobundle#end()
filetype plugin indent on

"colorscheme
colorscheme jellybeans 


" im-indent-guides settings
let g:indent_guides_auto_colors=0
au VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=240
au VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=248
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1


"neocomplcache settings
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()""


"quickrun setting
let g:quickrun_config = {
		\   "_" : {
		\       "runner"                               : "vimproc",
		\       "runner/vimproc/updatetime"            : 40,
		\		"hook/time/enable"                     : 1,
		\       "hook/close_buffer/enable_empty_data"  : 1,
		\      	"outputter/buffer/split"               : ":botright 6sp",
		\       "hook/shabadoubi_touch_henshin/enable" : 1,
		\       "hook/shabadoubi_touch_henshin/wait"   : 20,
		\   },
		\}

"quickrun key settings 
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


"previm_open_cmd setting
augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"let g:previm_open_cmd = 'open -a Firefox'


"vim-easy-align key setting
vmap <Enter> <Plug>(EasyAlign)


"other key setting
nnoremap <Space>o :only<CR>
nnoremap <ESC><ESC> :noh<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
