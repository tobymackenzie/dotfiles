##PS1="[<\t@\h:\W>] "
PS1="[\u:\W]>"
tputColors="$(tput colors 2> /dev/null || echo 2)"
if [ $tputColors -gt 2 ]; then
	if [ $tputColors -gt 8 ]; then
		tputFG="$(tput setab 42)$(tput setaf 0)"
	else
		tputFG="$(tput setab 2)$(tput setaf 7)"
	fi
	tputReset="$(tput sgr0)"
	PS1="${tputFG}${PS1}${tputReset}"
fi
export PS1="$PS1 "
