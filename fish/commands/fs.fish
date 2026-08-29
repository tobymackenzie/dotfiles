#==list
function lll
	ll $argv | less
end

#==path movement
abbr --add -- - 'cd -'
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
	cd "~/__/$argv"
end
#-! illegal function name
#function /
#	cd "/$argv"
#end
function cdbin
	cd "$TJMLBIN/$argv"
end
alias bin="cdbin"
function checkouts
	if [ ! -e "$TJMCHECKOUT" ]
		mdkir -p "$TJMCHECKOUT"
	end
	cd "$TJMCHECKOUT/$argv"
end
alias co="checkouts"

#==stats
switch $TJMOS
	case 'darwin'
		alias d="du -hxd 0"
	case *
		alias d="du -hx --max-depth 0"
end
