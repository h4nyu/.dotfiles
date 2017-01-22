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
