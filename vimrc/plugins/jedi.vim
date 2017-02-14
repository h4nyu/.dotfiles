"-----------------
" jedi
"-----------------
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = "<C-]>"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<C-d>"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "R"

let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif
