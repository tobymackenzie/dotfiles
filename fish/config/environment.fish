#--shell vars
set -x TJMTCOLORS (tput colors 2> /dev/null; or echo 2)

#--determine OS for later decisions
#-@ http://stackoverflow.com/a/18434831/1139122
#-@ http://stackoverflow.com/a/2264537/1139122
set -x TJMOS (uname | tr '[:upper:]' '[:lower:]')
switch $TJMOS
	case 'windowsnt'
		set -x TJMOS 'windows'
	case 'sunos'
		set -x TJMOS 'solaris'
end
