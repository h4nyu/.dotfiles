"-----------------
" YouCompleteMe
"-----------------
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/ycm_extra_conf.py'

 " YouCompleteMe setup
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'unite': 1}
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_complete_in_comments = 1

" UltiSnips setup
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-s-k>'

let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }

nnoremap gd :<C-u> YcmCompleter GoToDefinition<CR>
nnoremap gl :<C-u> YcmCompleter GoToDeclaration<CR>
nnoremap gt :<C-u> YcmCompleter GetType<CR>
nnoremap gp :<C-u> YcmCompleter GetParent<CR>
nnoremap fi :<C-u> YcmCompleter FixIt<CR>
nnoremap <F5> :<C-u>YcmForceCompileAndDiagnostics<CR>

