"-----------------
" YouCompleteMe
"-----------------
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/ycm_extra_conf.py'
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }
