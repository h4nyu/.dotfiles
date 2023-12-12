" ================
" basic config
" ================
" 
if &diff
    set diffopt-=internal
    set diffopt+=vertical
endif
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
set encoding=utf-8
set wildmenu
set incsearch
set cmdheight=1
set nowritebackup
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set completeopt=menu,menuone
set foldmethod=indent   
set foldnestmax=11
set nofoldenable
set foldlevel=2
set foldcolumn=3
set path+=/opt/ros/indigo/include
set path+=/opt/ros/jade/include
set path+=/usr/include
set path+=/usr/local/include
set tags=./tags;
set autoread
set smartcase
set incsearch
set guicursor=
set timeoutlen=500
set ttimeoutlen=50

au CursorHold * checktime

let mapleader = "\<Space>"

set background=dark
set t_Co=256

let loaded_matchparen = 1
hi MatchParen ctermbg=1

au QuickfixCmdPost make,grep,grepadd,vimgrep copen
let g:python_host_prog = system("bash -c 'echo -n $(which python2)'")
let g:python3_host_prog = system("bash -c 'echo -n $(which python3)'")

" ================
" keys
" ================
nnoremap <silent><buffer>q :quit<CR>
nnoremap <silent><ESC><ESC> :<C-u>noh<CR>
inoremap <silent> jj <ESC>
nnoremap <C-w>o :<C-u>only<CR>

" ================
" filetypes
" ================
"
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType vue syntax sync fromstart
    autocmd FileType nginx setl sw=2 sts=2 et
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType java setlocal ts=2 sts=2 sw=2 expandtab
augroup END

au BufNewFile,BufRead *.in set filetype=requirement
au BufNewFile,BufRead *.swift set filetype=swift
au BufNewFile,BufRead *.html set filetype=xml
au BufNewFile,BufRead *.tsx set filetype=typescript
au BufNewFile,BufRead *.prisma setfiletype graphql

au FileType python set efm+=%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" ================
" plugins 
" ================

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-rooter'
Plug 'junegunn/vim-easy-align'

" syntax highlight
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-python/python-syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-copilot'

Plug 'github/copilot.vim'

Plug 'itchyny/vim-cursorword'
Plug 'wakatime/vim-wakatime'
Plug 'dhruvasagar/vim-table-mode'
Plug 'rhysd/clever-f.vim'
call plug#end()


" disable conceal
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" ------------
" junegunn/fzf
" -----------
let g:fzf_layout = { 'down': '~60%' }
nnoremap <silent> <Leader><Leader> :GitFiles<CR>
nnoremap <silent> <CR><CR> :GitFiles<CR>
nnoremap <silent> <Leader>fc :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <CR>fc :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <CR>l :Lines<CR>
nnoremap <silent> <Leader><CR> :Ag<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <CR>h :Lines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <CR>b :Lines<CR>
" ------------------------
" tpope/vim-commentary
" ------------------------
xmap <Leader>c :Commentary<CR>
nmap <Leader>c :Commentary<CR>
xmap <CR>c :Commentary<CR>
nmap <CR>c :Commentary<CR>

" -------------------
" Yggdroot/indentLine
" -------------------
let g:indentLine_color_term = 240
let g:indentLine_char = "|"

" ------------------
" tpope/vim-fugitive
" ------------------
nnoremap    [git]   <Nop>
nmap    <Leader>g [git]
nmap    <CR>g [git]
nnoremap [git]s :<C-u>Git<CR>
nnoremap [git]p :<C-u>Git push<CR>

" ---------------------
" itchyny/lightline.vim
" ---------------------
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*FugitiveHead")
    let branch = FugitiveHead()
    return branch !=# '' ? '|/'.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" --------------------
" jiangmiao/auto-pairs
" --------------------
let g:AutoPairsMapCR = 0

" ------------------------
" vim-python/python-syntax
" ------------------------
let g:python_highlight_all = 1


" -------------------
" airblade/vim-rooter
" -------------------
let g:rooter_patterns = ['.git/']

" -------------------
"  peitalin / vim-jsx-typescript
" -------------------
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

" w0ng/vim-hybrid
colorscheme hybrid

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" -------------------
"  easymotion
" -------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout

" s{char}{char} to move to {char}{char}
map  s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" -------------------
"  junegunn/vim-easy-align
" -------------------
xmap ga <Plug>(LiveEasyAlign)
nmap ga <Plug>(LiveEasyAlign)

" -------------------
"  Shougo/deoplete.nvim
" -------------------
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"




" ----  dhruvasagar/vim-table-mode ----

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
" ----  dhruvasagar/vim-table-mode ----

" -------------------
"  nvim-cmp
" -------------------
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local source_mapping = {
    vsnip = '[Vsnip]',
	buffer = "[Buffer]",
	path = "[Path]",
    copilot = "[Cop]",
  }


  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    formatting = {
	  format = function(entry, vim_item)
	  	local menu = source_mapping[entry.source.name]
	  	vim_item.menu = menu
	  	return vim_item
	  end
	},

    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-k>'] = cmp.mapping.confirm({ select = true }),
      ['<C-f>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping.abort(), 
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'omni' },
      { name = 'nvim_lsp' },
      { name = 'calc' },
      { name = 'path' },
      { name = 'copilot' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })


  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

" ================
" custom styles
" ================
hi LineNr ctermfg=grey cterm=bold
