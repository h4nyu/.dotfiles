set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe 

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ 
  \ }

nnoremap  f <Nop>
nnoremap  ff :<C-u>CtrlP<CR>
nnoremap  fb :<C-u>CtrlPBuffer<CR>
nnoremap  fm :<C-u>CtrlPMRUFiles<CR>
nnoremap  ft :<C-u>CtrlPBufTagAll<CR>
nnoremap  fl :<C-u>CtrlPLine<CR>
nnoremap  fc :<C-u>CtrlPCurFile<CR>
nnoremap  fu :<C-u>CtrlPCurWD<CR>
nnoremap  fg :<C-u>CtrlPBufLine<CR>
