##PS1="[<\t@\h:\W>] "
PS1="[\u:\W]>"
tputColors="$(tput colors 2> /dev/null || echo 2)"
if [ $tputColors -gt 2 ]; then
	if [ $tputColors -gt 8 ]; then
		PS1="\[$(tput setab 42)$(tput setaf 0)\]${PS1}"
	else
		PS1="\[$(tput setab 2)$(tput setaf 7)\]${PS1}"
	fi
	PS1+="\[$(tput sgr0)\]"
fi
unset -v tputColors
#-# PS0 shows timestamp before command in BASH>=4.4
export PS0="@ \$(date '+%H:%M:%S %Y-%m-%d')\n"
export PS1="@ \$(date '+%H:%M:%S %Y-%m-%d')\n$PS1 "
