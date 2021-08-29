alias gs='git status'
alias ga='git add -A'
alias gp='git push'
alias gc='git commit -a'
alias vim='nvim'
alias vi='nvim'

set -x EDITOR nvim
if not pgrep --full ssh-agent | string collect > /dev/null
  eval (ssh-agent -c)
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end
