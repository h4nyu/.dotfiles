"-----------------
" unite.vim
"-----------------
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
" The prefix key.
nnoremap  <Space>u :<C-u>Unite<CR>
nnoremap  <Space>ff :<C-u>Unite<Space>file_rec/async<CR>
nnoremap  <Space>gg :<C-u>Unite<Space>file_rec/git<CR>
nnoremap  <Space>o :<C-u>Unite<Space>outline<CR>
nnoremap  <Space>l :<C-u>Unite<Space>line<CR>
nnoremap  <Space>j :<C-u>Unite<Space>jump<CR>
nnoremap  <Space>s :<C-u>Unite grep/git:.<CR>
nnoremap  <Space>b :<C-u>Unite<Space>buffer<CR>
nnoremap  <Space>h :<C-u>Unite<Space>file_mru<CR>
nnoremap  <Space>fc :<C-u>UniteWithBufferDir file file/new -buffer-name=file<CR>
nnoremap  <Space>c :<C-u>Unite<Space>change<CR>

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
