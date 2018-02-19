"-----------------
" jedi
"-----------------
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = "ga"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#usages_command = "gl"
let g:jedi#rename_command = "R"

let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif
