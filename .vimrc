if has("syntax")
      syntax on
endif

set noswapfile
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
set nowritebackup
set softtabstop=4
set completeopt=menuone
set expandtab


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
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'joker1007/vim-markdown-quote-syntax'

"filer
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'

"scrip 
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neomru.vim'

"edit tool
NeoBundle 'vim-easy-align'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'cohama/lexima.vim'

"NeoBundle 'scrooloose/syntastic.git'

NeoBundleCheck
call neobundle#end()
filetype plugin on

"colorscheme
colorscheme jellybeans 



"--------------------------
" vim-indent-guides settings
"--------------------------
let g:indent_guides_auto_colors=0
au VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=240
au VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=240
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1


" -----------
" neocomplete
" -----------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"-----------------
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif


"----------------
"quickrun setting
"----------------
let g:quickrun_config = {
		\   "_" : {
		\       "outputter/buffer/split"               : ":botright 10sp",
		\       "runner"                               : "vimproc",
		\       "runner/vimproc/updatetime"            : 40,
		\		"hook/time/enable"                     : 1,
		\       "hook/close_buffer/enable_empty_data"  : 1,
		\       "hook/shabadoubi_touch_henshin/enable" : 1,
		\       "hook/shabadoubi_touch_henshin/wait"   : 20,
		\   },
		\   "python" : {
		\       "cmdopt" : "-u"
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
let g:quickrun_config['markdown'] = {
      \   'outputter': 'browser'
      \ }

"---------------------
"quickrun key settings 
"---------------------
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <F9> :w<CR>:QuickRun<Space>

"git key settings
nnoremap    [git]   <Nop>
nmap    <Space>g [git]
nnoremap [git]w :<C-u>Gwrite<CR>
nnoremap [git]b :<C-u>Gblame<CR>
nnoremap [git]d :<C-u>Gdiff<CR>
nnoremap [git]s :<C-u>Gstatus<CR>
nnoremap [git]p :<C-u>Git push origin master<CR>
nnoremap [git]a :<C-u>Git add -A<CR>
nnoremap [git]c :<C-u>Gcommit<CR>


"-----------------------
" vim-markdown
"-----------------------
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.{txt,text} set filetype=markdown


"-----------------------
"previm_open_cmd setting
"-----------------------
augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"keymap
nnoremap <F8> :PrevimOpen<CR>
"vim-easy-align key setting
vmap <Enter> <Plug>(EasyAlign)

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Space>f [unite]


"-----------------
" unite.vim keymap
"-----------------
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
noremap  <silent> [unite]c :<C-u>UniteWithBufferDir file file/new -buffer-name=file<CR>
nnoremap <silent> ,vr :UniteResume<CR>


"-----------------
" lightline 
"-----------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

"other key setting
nnoremap <silent><Space>o     :<C-u> only<CR>
nnoremap <silent><ESC><ESC>   :<C-u>noh<CR>
noremap <silent><C-e> :<C-u> NERDTreeToggle<CR>
noremap <silent> <C-S-b> :<C-u>QuickRun<CR>

imap <F5> <nop>
set pastetoggle=<F5>

inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> hh <ESC>
inoremap <silent> っｈ <ESC>
inoremap <silent> ll <ESC>
inoremap <silent> っｌ <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k
autocmd FileType python setlocal completeopt-=preview
