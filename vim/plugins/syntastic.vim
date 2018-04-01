set statusline+=%#warningmsg#
set statusline+=%*
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_python_checkers=["flake8"]

let g:statline_syntastic = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11'
