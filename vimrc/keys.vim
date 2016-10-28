"-----------------
" other keybind
"-----------------
nnoremap <silent><Space>o :<C-u>only<CR>
nnoremap <silent><ESC><ESC> :<C-u>noh<CR>
inoremap <silent> jj <ESC>



"-----------------
" Easy Align
"-----------------
vmap <Enter> <Plug>(EasyAlign)

"-----------------
" Autopep8
"-----------------
autocmd FileType python map <buffer> <leader>f :<C-u>w<CR>:<C-u>call Autopep8()<CR>:<C-u>w<CR>
