if [[ ! -f ~/.antigen/antigen.zsh ]]; then
    curl -L git.io/antigen --create-dirs -o ~/.antigen/antigen.zsh
fi

if [[ -f ~/.antigen/antigen.zsh ]]; then
    source ~/.antigen/antigen.zsh
    antigen bundle zsh-users/zsh-completions
    antigen bundle zsh-users/zsh-autosuggestions
    antigen apply
fi
bindkey -e
bindkey "\e[Z" reverse-menu-complete

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit && compinit -u
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' verbose no
zstyle ':completion:*' verbose no
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin

setopt MENU_COMPLETE
setopt no_beep  # 補完候補がないときなどにビープ音を鳴らさない。
setopt no_nomatch # git show HEAD^とかrake foo[bar]とか使いたい
setopt prompt_subst  # PROMPT内で変数展開・コマンド置換・算術演算を実行
setopt transient_rprompt  # コマンド実行後は右プロンプトを消す
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups  # 重複したヒストリは追加しない
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_verify
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt extended_history  # 履歴ファイルに時刻を記録
#setopt hist_expand  # 補完時にヒストリを自動的に展開する。
setopt append_history  # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt auto_cd  # ディレクトリ名だけで移動
setopt auto_pushd  # cd したら pushd
setopt auto_list  # 補完候補が複数ある時に、一覧表示
setopt auto_menu  # 補完候補が複数あるときに自動的に一覧表示する
#setopt auto_param_slash
setopt list_packed
setopt list_types
setopt no_flow_control
setopt print_eight_bit
setopt pushd_ignore_dups
setopt rec_exact
setopt autoremoveslash
unsetopt list_beep
setopt complete_in_word  # カーソル位置で補完する。
setopt glob
setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt extended_glob  # 拡張globを有効にする。
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt numeric_glob_sort  # 辞書順ではなく数字順に並べる。
setopt magic_equal_subst  # コマンドライン引数の --prefix=/usr とか=以降でも補完
setopt always_last_prompt  # 無駄なスクロールを避ける

## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する。
REPORTTIME=3

compinit -u
if [ -e ~/.zsh/completion ]; then
    fpath=(~/.zsh/completion $fpath)
fi
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -e ~/.antigen/bundles/zsh-users/zsh-completions/src ]; then
    fpath=(~/.antigen/bundles/zsh-users/zsh-completions/src $fpath)
fi


autoload -Uz vcs_info

# PROMPT変数内で変数参照
setopt prompt_subst

# prompt
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

export LSCOLORS=xbfxcxdxbxegedabagacad
export LS_COLORS='di=01;33:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

precmd() { vcs_info }
PROMPT='%F{green}%n@%m:%f%~%F{green}$%f '
RPROMPT='${vcs_info_msg_0_}'

# alias
alias '..'='cd ..'
alias ll='ls -l'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'
alias gs='git status' 
alias gp='git push' 
alias gf='git fetch' 
alias ag='ag -S -p ~/.ignore' 

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color=auto"
  ;;
esac



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

export FZF_DEFAULT_COMMAND='ag -S -p ~/.ignore --files-with-matches .'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export EDITOR=vim
export TERM=xterm-256color
export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
