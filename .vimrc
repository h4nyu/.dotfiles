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
set nobackup
set nowritebackup
set softtabstop=4

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
NeoBundle 'Shougo/unite.vim'

"scrip 
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neomru.vim'

"edit tool
NeoBundle 'vim-easy-align'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tomtom/tcomment_vim'

NeoBundleCheck
call neobundle#end()
filetype plugin indent on

"colorscheme
colorscheme jellybeans 



" im-indent-guides settings
let g:indent_guides_auto_colors=0
au VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=240
au VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=240
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1


"neocomplcache settings
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" plugin key-mappings.
imap <c-k>     <plug>(neocomplcache_snippets_expand)
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
		\       "outputter/buffer/split"               : ":botright 8sp",
		\       "runner"                               : "vimproc",
		\       "runner/vimproc/updatetime"            : 40,
		\		"hook/time/enable"                     : 1,
		\       "hook/close_buffer/enable_empty_data"  : 1,
		\       "hook/shabadoubi_touch_henshin/enable" : 1,
		\       "hook/shabadoubi_touch_henshin/wait"   : 20,
		\   },
		\   "avr-gcc" : {
		\       "command"   : "avr-gcc",
		\       "exec" : "%c %o %s -o %S:p:r",
		\       "cmdopt" : "-Os -DF_CPU=16000000UL -mmcu=atmega328p ",
		\   },
		\   "avr-objcopy" : {
		\       "command"   : "avr-objcopy",
		\       "exec" : "%c %o  %S:p:r %S:p:r.hex",
		\       "cmdopt" : "-O ihex",
		\   },
		\   "avrdude" : {
		\       "command"   : "avrdude",
		\       "exec" : "%c %o %S:p:r.hex",
		\       "cmdopt" : "-F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -U",
		\   },
		\}


"quickrun key settings 
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <F9> :QuickRun<Space>

"git key settings
nnoremap \gw :<C-u>Gwrite<CR>
nnoremap \gb :<C-u>Gblame<CR>
nnoremap \gd :<C-u>Gdiff<CR>
nnoremap \gs :<C-u>Gstatus<CR>
nnoremap \gp :<C-u>Git push origin master<CR>
nnoremap \ga :<C-u>Git add -A<CR>
nnoremap \gc :<C-u>Gcommit<CR>




"previm_open_cmd setting
augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

nnoremap <F8> :PrevimOpen<CR>
"let g:previm_open_cmd = 'open -a Firefox'


"vim-easy-align key setting
vmap <Enter> <Plug>(EasyAlign)

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

" unite.vim keymap
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

"other key setting
nnoremap <Space>o :only<CR>
nnoremap <ESC><ESC> :noh<CR>
noremap <silent><C-e> :NERDTreeToggle<CR>
