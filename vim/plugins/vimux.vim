function! s:compile_and_run()
    exec 'wa'
    call VimuxRunCommand('clear') 
    if &filetype == 'c'
        call VimuxRunCommand('gcc % -o %<; time ./' . expand('%<')) 
    elseif &filetype == 'sh'
        call VimuxRunCommand('bash ' . expand('%')) 
    elseif &filetype == 'python'
        call VimuxRunCommand('python ' . expand('%')) 
    elseif &filetype == 'python.pytest'
        call VimuxRunCommand('pytest --capture=no ' . expand('%')) 
    elseif &filetype == 'ruby'
        call VimuxRunCommand('ruby ' . expand('%')) 
    elseif &filetype == 'plantuml'
        call VimuxRunCommand('plantuml ' . expand('%')) 
    endif
endfunction

nnoremap <leader>rr :call <SID>compile_and_run()<CR>
nnoremap <leader>rc :VimuxPromptCommand<CR>
nnoremap <leader>rl :VimuxRunLastCommand<CR>
nnoremap <leader>i :VimuxInspectRunner<CR>
