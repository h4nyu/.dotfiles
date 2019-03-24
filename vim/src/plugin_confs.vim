" 
" ------------
" junegunn/fzf
" ------------
nnoremap <Space><Space> :FZF<CR>
nnoremap <Space>fc :Files %:p:h<CR>
nnoremap <Space>gf :GFiles<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>h :History<CR>
nnoremap <Space>c :Commits<CR>
nnoremap <Space>l :Lines<CR>
nnoremap <Space>/ :BLines<CR>
nnoremap <Space>a :Ag<Space>


" -------------------------
" easymotion/vim-easymotion
" -------------------------
" <Leader>f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map L <Plug>(easymotion-bd-jk)
nmap L <Plug>(easymotion-overwin-line)

" Move to word
map  W <Plug>(easymotion-bd-w)
nmap W <Plug>(easymotion-overwin-w)
let g:EasyMotion_smartcase = 1

" w0ng/vim-hybrid
colorscheme hybrid


" ------------------------
" scrooloose/nerdcommenter
" ------------------------
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a  region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
nnoremap <Space>c :call NERDComment(0,"toggle")<CR>
vnoremap <Space>c :call NERDComment(0,"toggle")<CR>


" -------------------
" Yggdroot/indentLine
" -------------------
let g:indentLine_color_term = 240
let g:indentLine_char = "|"

" ------------------
" tpope/vim-fugitive
" ------------------
nnoremap    [git]   <Nop>
nmap    <space>g [git]
nnoremap [git]s :<C-u>Gstatus<CR>
nnoremap [git]w :<C-u>Gwrite<CR>
nnoremap [git]r :<C-u>Gmove
nnoremap [git]d :<C-u>Gdiff<CR>
nnoremap [git]c :<C-u>Gcommit<CR>
nnoremap [git]l :<C-u>Glog<CR>
nnoremap [git]b :<C-u>Gblame<CR>
nnoremap [git]p :!git push<CR>

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
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
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
" tell-k/vim-autopep8
" -------------------
autocmd FileType python noremap <buffer> <Leader>f :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1

" -------------------
" airblade/vim-rooter
" -------------------
autocmd FileType python noremap <buffer> <Leader>f :call Autopep8()<CR>
let g:rooter_patterns = ['.git/']

" -----------------
" ervandew/supertab
" -----------------

let g:SuperTabDefaultCompletionType = "<c-n>"


" -----------------------
" vim-syntastic/syntastic
" -----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
