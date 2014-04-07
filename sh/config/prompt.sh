##PS1="[<\t@\h:\W>] "
PS1="[<\u:\W>] "
if [ -n "${TERM}" ]; then
	tputReset="$(tput sgr0)"
	tputFG="$(tput setaf 2)"
else
	tputRest=""
	tputFG=""
fi
export PS1="\[${tputFG}\]${PS1}\[${tputReset}\]"
