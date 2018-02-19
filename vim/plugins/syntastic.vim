set statusline+=%#warningmsg#
set statusline+=%*

let g:statline_syntastic = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=["pep8"]
let g:syntastic_cpp_compiler_options = '-std=c++11'
