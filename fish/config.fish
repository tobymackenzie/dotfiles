#--path

#--aliases
#---directories
alias __="cd {$HOME}/__"
#alias ~="cd {$HOME}"
	#alias /="cd /"
alias cdbin="cd ~/bin"
alias bin="cdbin"
alias cdhome="cd {$HOME}"

#---files
alias cp="cp -pri"
alias d="du -hxd 0"
alias d1="d -d 1"
alias df="df -h"
alias du="du -h"
alias l="ls -FG"
alias lla="ll -A"
alias o="open"
alias macvim="open -a MacVim"
alias mv="mv -i"
alias rmi=" rm -i"
alias scp="scp -pr"

#---proccesses
alias stop="killall -STOP"
alias cont="killall -CONT"
alias t="top -S -n 0 -s 5"
alias tcpu="top -S -ocpu -s 2"
alias tmem='top -S -orsize -s 5'
alias ttime='top -otime -s 5'

#---source control
#----git
alias gitcommit="git diff --cached | less; and git commit"
alias gitcommitall="git add .; and gitcommit"
#----svn
alias svnstatus="svn status --ignore-externals"
alias svnstatusa="svn status"
alias svnupdate="svn update --ignore-externals"
alias svnupdatea="svnupdate"
