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


