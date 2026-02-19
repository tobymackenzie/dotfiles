##--hold general aliases that don't fit elsewhere
alias reshell="exec $TJM_SHELL"
alias tputshow='tputcolor'

#--better defaults
alias cp="cp -pri"
alias df="df -h"
alias du="du -h"
alias mv="mv -i"
alias scp="scp -pr"

#--merge options to command for quicker typing, autocomplete
alias grepr="grep -R"
alias grepri="grep -Ri"
alias greprl="grep -Rl"
alias greprli="grep -Rli"
alias typa="type -a"
alias typea="type -a"

#--custom config path
alias lynx="lynx -cfg ~/.dotfiles/lynx/lynx.cfg"
alias w3m="w3m -config ~/.dotfiles/w3m/config"

#--data
alias wttr="curl wttr.in"

#--run proj
alias t="_tjmRunProj tbin tbin"
alias proj="_tjmRunProj base.proj bin/console"

#--whimsy
alias greetings="hello weirdo"
alias hey="hello"
alias heya="hello"
alias hi="hello there"
alias whatup="hello dude"
