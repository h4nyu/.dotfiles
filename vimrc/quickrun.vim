"----------------
"quickrun setting
"----------------
let g:quickrun_config = {
\   "_" : {
        \       "outputter/buffer/split"               : ":belowright 6sp",
        \       "runner"                               : "vimproc",
        \       "runner/vimproc/updatetime"            : 60,
        \       'outputter': 'buffer',
        \       "outputter/error/error" : "quickfix",
        \       "outputter/error/success" : "buffer",
        \		"hook/time/enable"                     : 1,
        \       "hook/close_buffer/enable_empty_data"  : 1,
        \       "hook/shabadoubi_touch_henshin/enable" : 1,
        \       "hook/shabadoubi_touch_henshin/wait"   : 20,
        \   },
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

let g:quickrun_config['xacro.xml'] = {
      \   'command': 'rosrun',
      \   'cmdopt': 'xacro xacro',
      \   'exec': '%c %o %s > %s:p:r.urdf',
      \ }

let g:quickrun_config['cpp'] = {
      \   'command': 'make',
      \   'cmdopt': 'run',
      \   'exec': '%c %o',
      \   "outputter": "error:buffer:quickfix"
      \ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
noremap <silent> <leader>r :w<CR>:<C-u>Ctags<CR>:<C-u>QuickRun<CR>
