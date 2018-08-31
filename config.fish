function sync_history --on-event fish_preexec
    history --save
    history --merge
end

set -x LSCOLORS exfxcxdxbxegedabagacad
set -x LS_COLORS 'di=01;94:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
set -x EDITOR vim
set -x TERM xterm-256color


alias gs='git status' 
alias gp='git push' 
alias gf='git fetch' 
alias ag='ag -S -p ~/.ignore' 

git config --local push.default simple
git config --local merge.tool vimdiff
git config --local merge.conflictstyle diff3
git config --local mergetool.prompt false
git config --local mergetool.keepBackup false
git config --local credential.helper cache
git config --local core.autocrlf false
git config --local credential.helper 'cache --timeout 28800'
git config --local http.postBuffer 52428800
stty -ixon

if test -e ~/.env.fish
    source ~/.env.fish
end
