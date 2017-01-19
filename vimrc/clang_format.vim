let g:clang_format#style_options = {
            \ "BasedOnStyle" : "LLVM",
            \ "AccessModifierOffset" : -4,
            \ "IndentWidth": 4,
            \ "BreakConstructorInitializersBeforeComma" : "true",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "BreakBeforeBraces": "Linux",
            \ "Standard" : "C++11"}

let g:clang_format#command = 'clang-format-3.5'

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
