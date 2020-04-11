##PS1="[<\t@\h:\W>] "
PS1="[\u:\W]>"
if [ -n "${TERM}" ]; then
	tputColors="$(tput colors || 2)"
	if [ $tputColors -gt 8 ]; then
		tputFG="$(tput setab 42)$(tput setaf 0)"
	else
		tputFG="$(tput setab 2)$(tput setaf 7)"
	fi
	tputReset="$(tput sgr0)"
	PS1="${tputFG}${PS1}${tputReset}"
fi
export PS1="$PS1 "
