function! s:compile_and_run()
    exec 'wa'
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

function! s:docker_compose_exec()
    exec ':wa'
    let l:root_dir = FindRootDirectory()
    let l:service = fnamemodify(getcwd(), ':t')
    if &filetype == 'python'
        call VimuxRunCommand('docker-compose -f '.l:root_dir.'/docker-compose.yml exec  -T '.l:service.' python '. expand('%')) 
    elseif &filetype == 'python.pytest'
        call VimuxRunCommand('docker-compose -f '.l:root_dir.'/docker-compose.yml exec  -T '.l:service.' pytest '. expand('%')) 
    endif
endfunction

nnoremap <leader>vr :call <SID>compile_and_run()<CR>
nnoremap <leader>vd :call <SID>docker_compose_exec()<CR>
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vi :VimuxInspectRunner<CR>
