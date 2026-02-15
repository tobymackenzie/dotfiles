#==title
case "$TERM" in
	xterm*|rxvt|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
	;;
##	screen)
##		PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
##	;;
esac
