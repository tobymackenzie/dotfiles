##PS1="[<\t@\h:\W>] "
PS1="[\u:\W]>"
if [ -n "${TERM}" ]; then
	tputFG="$(tput setab 2)$(tput setaf 7)"
	tputReset="$(tput sgr0)"
	PS1="${tputFG}${PS1}${tputReset}"
fi
export PS1="$PS1 "
