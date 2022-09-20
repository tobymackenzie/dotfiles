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

#==apps
#--edit: edit argument(s) in `vi`. If passed a command, will run that command and pipe to `vi`.  Otherwise, pass as arguments to `vi`.
function e -a arg1
	if test -n "$argv"; and test ! -e "$arg1"; and test -x (command -v "$arg1")
		#-# use read only for standard in to make it easier to quit. To write, use `:w filename` method
		$argv | vi -R -
	else
		vi $argv
	end
end
#--view: view argument(s) in `less`. If passed a command, will run that command and pipe to `less`.  Otherwise, pass as arguments to `less`.
function v -a arg1
	if test -n "$argv"; and test ! -e "$arg1"; and test -x (command -v "$arg1")
		$argv | less
	else if test -z "$arg1" -o -d "$arg1"
		ll $argv | less
	else
		less $argv
	end
end
