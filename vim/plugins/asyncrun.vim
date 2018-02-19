
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(16, 1)
augroup END
nnoremap  <C-c> :AsyncStop<CR>

nnoremap tg :exe '!<CR>
function! s:compile_and_run()
    exec 'wa'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! bash %"
    elseif &filetype == 'python'
       exec 'AsyncRun! python %'
    elseif &filetype == 'pyrex'
       exec "AsyncRun! make"
    elseif &filetype == 'python.pytest'
       exec 'AsyncRun! pytest --capture=no %'
    elseif &filetype == 'markdown'
       exec "AsyncRun! pandoc -t html5 -c /css/github.css %  -o %s:p:r.html"
    elseif &filetype == 'ruby'
       exec "AsyncRun! ruby  %"
    elseif &filetype == 'xacro.xml'
       exec "AsyncRun! rosrun xacro xacro --inorder % > %s:p:r.urdf"
    elseif &filetype == 'plantuml'
       exec "AsyncRun plantuml %"
    endif
endfunction

function! s:docker_compose_exec()
    exec ':wa'
    let l:root_dir = FindRootDirectory()
    let l:service = fnamemodify(getcwd(), ':t')
    if &filetype == 'python'
        exec 'AsyncRun docker-compose -f '.l:root_dir.'/docker-compose.yml exec  -T '.l:service.' python %'
    elseif &filetype == 'javascript.jsx'
        exec "AsyncRun docker-compose exec -T ". l:service . ' webpack'
    elseif &filetype == 'javascript'
        exec 'AsyncRun docker-compose -f '.l:root_dir.'/docker-compose.yml exec  -T '.l:service.' webpack'
    elseif &filetype == 'python.pytest'
        exec 'AsyncRun docker-compose -f '.l:root_dir.'/docker-compose.yml exec  -T '.l:service.' pytest %'
    endif
endfunction


nnoremap <leader>r :call <SID>compile_and_run()<CR>
nnoremap <leader>e :call <SID>docker_compose_exec()<CR>
