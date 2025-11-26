#--case insensitive completions
if [ -n "$BASH_VERSION" ] && [[ $- == *-i* ]] && type caller >/dev/null 2>&1; then
	bind 'set completion-ignore-case on'
fi
