#==gui
if [ $TJM_OS = 'darwin' ]
	alias console="open -a console"
	alias o="open"
	alias oa="open -a"
	alias og="ogit"
	alias ogit="open -a 'GitX'"
	alias ot="open -t"
	alias sublime="oa 'Sublime Text 2'"
	alias macvim="oa MacVim"
end

#==list
switch $TJM_OS
	case 'darwin'
		alias l="ls -FG"
	case *
		alias l="ls -F --color"
end
alias ll="l -lh"
alias la="l -A"
alias lla="ll -A"
function lll
	ll $argv | less
end

#==path movement
#-! fish can't handle function names beginning with dash, via <https://github.com/oh-my-fish/oh-my-fish/issues/487>.  So…
#alias -- -="cd -"
function cl
	cd $argv; and l
end
function cll
	cd $argv; and ll
end

#==operations
alias cp="cp -pri"
alias mv="mv -i"
alias rmi=" rm -i"
alias scp="scp -pr"

#==stats
alias du="du -h"
switch $TJM_OS
	case 'darwin'
		alias d="du -hxd 0"
	case *
		alias d="du -hx --max-depth 0"
end
alias d1="d -d 1"
alias df="df -h"
