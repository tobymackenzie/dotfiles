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
function mkcd
	mkdir -p $argv; and cd $argv
end
#--specific
#-@ https://stackoverflow.com/a/47902450/1139122
function __
	cd "$TJM_MAIN_PATH/$argv"
end
#-! illegal function name
#function /
#	cd "/$argv"
#end
function cdbin
	cd "$TJM_BIN_PATH/$argv"
end
alias bin="cdbin"
function checkouts
	cd "$TJM_CHECKOUTS_PATH/$argv"
end
alias co="checkouts"

#==stats
switch $TJM_OS
	case 'darwin'
		alias d="du -hxd 0"
	case *
		alias d="du -hx --max-depth 0"
end
