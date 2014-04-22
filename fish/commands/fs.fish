#==gui
if [ $TJM_OS = 'darwin' ]
	alias console="open -a console"
	alias o="open"
	alias ogit="open -a 'GitX'"
	alias sublime="open -a 'Sublime Text 2'"
	alias ot="open -t"
	alias macvim="open -a MacVim"
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

function cl
	cd $argv; and l
end
function cll
	cd $argv; and ll
end
function lll
	ll $argv | less
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
