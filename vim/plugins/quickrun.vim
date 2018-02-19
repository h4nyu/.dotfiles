"----------------
"quickrun setting
"----------------
let g:quickrun_config = {
\   "_" : {
\       "hook/close_quickfix/enable_hook_loaded" : 1,
\       "hook/close_quickfix/enable_success" : 1,
\       "hook/close_buffer/enable_failure" : 1,
\       "hook/close_buffer/enable_empty_data" : 1,
\       "outputter" : "multi:buffer:quickfix",
\       "hook/shabadoubi_touch_henshin/enable" : 1,
\       "hook/shabadoubi_touch_henshin/wait" : 20,
\       "outputter/buffer/split" : ":botright 8sp",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\   }
\}
let g:quickrun_config['python'] = {
            \ 'command': 'python3',
            \ 'cmdopt': '-u',
            \ }
let g:quickrun_config['markdown'] = {
            \   'command': 'pandoc',
            \   'cmdopt': '-t html5 -c /css/github.css',
            \   'exec': '%c %o %s -o %s:p:r.html',
            \ }

let g:quickrun_config['cpp'] = {
      \ 'command': 'g++',
      \ 'cmdopt': '-std=c++11',
      \ }
let g:quickrun_config['ruby'] = {
      \ 'command': 'ruby',
      \ }
let g:quickrun_config['xacro.xml'] = {
            \   'command': 'rosrun',
            \   'cmdopt': 'xacro xacro --inorder',
            \   'exec': '%c %o %s > %s:p:r.urdf',
            \ }

let g:quickrun_config['python.pytest'] = {
      \'command': 'py.test',
      \'cmdopt': '-v',
      \'hook/shebang/enable': 0,
      \}

let g:quickrun_config['plantuml'] = {
            \   'command': 'plantuml',
            \   'exec': '%c %s',
            \ }

let g:quickrun_config['requirement'] = {
            \   'command': 'pip-compile',
            \   'exec': '%c %s',
            \ }

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <leader>r :wa<CR>:<C-u>QuickRun -mode n<CR>
xnoremap <leader>r :<C-U>:wa<CR>gv:QuickRun -mode v<CR> 



