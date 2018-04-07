# set pure_color_cyan (set_color "90B4E9")

set -x LSCOLORS ebfxcxdxbxegedabagacad
set -x LS_COLORS 'di=01;94:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
set -x EDITOR vim
set -x TERM xterm-256color
set -x FZF_DEFAULT_COMMAND 'ag -S -p ~/.ignore --files-with-matches .'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'


alias gs='git status' 
alias gp='git push' 
alias gf='git fetch' 
alias ag='ag -S -p ~/.ignore' 

git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
git config --global push.default simple
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global mergetool.keepBackup false
git config --global credential.helper cache
git config --global core.autocrlf false
git config --global credential.helper 'cache --timeout 28800'
git config --global http.postBuffer 52428800
stty -ixon
