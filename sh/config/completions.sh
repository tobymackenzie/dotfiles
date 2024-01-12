#--case insensitive completions
if [ -n "$BASH_VERSION" ] && type caller >/dev/null 2>&1; then
	bind 'set completion-ignore-case on'
fi
