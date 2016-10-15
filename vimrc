if has("syntax")
    syntax on
endif

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
set clipboard=unnamedplus
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
au BufRead,BufNewFile *.{conf,launch} set filetype=xml



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
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tell-k/vim-autopep8'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-build'
NeoBundle 'vim-easy-align'
NeoBundle 'Shougo/neocomplete'
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
NeoBundle 'tmhedberg/matchit'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'osyo-manga/vim-over'

NeoBundleCheck

call neobundle#end()
filetype plugin on


"--------------------------
" highlight
"--------------------------
colorscheme hybrid 
" let loaded_matchparen = 1
hi MatchParen ctermfg=gray ctermbg=22


" ================plugin configration================

"--------------------------
" vim-indent-guides settings
"--------------------------
let g:indent_guides_auto_colors=0
au VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=240
au VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=240
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1


"--------------------------
" neo snippets
"--------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"------------------------
" syntastic
"------------------------
let g:syntastic_python_checkers = ['flake8']
let g:autopep8_disable_show_diff=1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
autocmd FileType python map <buffer> <leader>f :<C-u>w<CR>:<C-u>call Autopep8()<CR>:<C-u>w<CR>


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
let g:neocomplete#sources#syntax#min_keyword_length = 2
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
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
"-----------------
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
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


"-----------------
" auto-tags
"-----------------
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']


"----------------
"quickrun setting
"----------------
let g:quickrun_config = {
\   "_" : {
        \       "outputter/buffer/split"               : ":belowright 6sp",
        \       "runner"                               : "vimproc",
        \       "runner/vimproc/updatetime"            : 60,
        \       'outputter': 'buffer',
        \       "outputter/error/error" : "quickfix",
        \       "outputter/error/success" : "buffer",
        \		"hook/time/enable"                     : 1,
        \       "hook/close_buffer/enable_empty_data"  : 1,
        \       "hook/shabadoubi_touch_henshin/enable" : 1,
        \       "hook/shabadoubi_touch_henshin/wait"   : 20,
        \   },
        \}
let g:quickrun_config['python'] = {
        \ 'command': 'python3',
        \ 'cmdopt': '-u',
        \ }
let g:quickrun_config['markdown'] = {
      \   'command': 'pandoc',
      \   'cmdopt': '-t html5 -c ./github.css',
      \   'exec': '%c %o %s -o %s:p:r.html',
      \ }

let g:quickrun_config['cpp'] = {
      \   'command': 'make',
      \   'cmdopt': 'run',
      \   'exec': '%c %o',
      \   "outputter": "error:buffer:quickfix"
      \ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
noremap <silent> <leader>r :w<CR>:<C-u>Ctags<CR>:<C-u>QuickRun<CR>


"---------------------
" fugitive and git config
"---------------------
nnoremap    [git]   <Nop>
nmap    <Space>g [git]
nnoremap [git]s :<C-u>Gstatus<CR>
nnoremap [git]w :<C-u>Gwrite<CR>
nnoremap [git]r :<C-u>Gmove
nnoremap [git]d :<C-u>Gdiff<CR>
nnoremap [git]c :<C-u>Gcommit<CR>
nnoremap [git]l :<C-u>Glog<CR>
nnoremap [git]b :<C-u>Gblame<CR>
nnoremap [git]p :!git push<CR>


"-----------------------
" vim-markdown
"-----------------------
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
let g:vim_markdown_conceal = 0
au BufRead,BufNewFile *.{txt,text} set filetype=markdown


"-----------------
" unite.vim
"-----------------
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Space>f [unite]
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
noremap  <silent> [unite]c :<C-u>UniteWithBufferDir file file/new -buffer-name=file<CR>
noremap <silent><C-S-b> :write<CR>:<C-u>Unite build<CR>


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



"-----------------
" other keybind
"-----------------
nnoremap <silent><Space>o :<C-u>only<CR>
nnoremap <silent><ESC><ESC> :<C-u>noh<CR>
inoremap <silent> jj <ESC>


"-----------------
" auto paste
"-----------------
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


"-----------------
" Easy Align
"-----------------
vmap <Enter> <Plug>(EasyAlign)


"-----------------
" split windows
"-----------------
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" ビジュアルモード選択した部分を*で検索
vnoremap / "zy:let @/ = @z<CR>n



"-----------------
" jedi
"-----------------
let g:jedi#goto_command = "<C-]>"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<C-d>"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "R"

let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif


"-----------------
" vim-rooter
"-----------------
let g:rooter_pattern = ['Makefile', '.git/']
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
