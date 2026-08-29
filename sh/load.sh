#--prevent double load, happens in Vim terminal
[ -n "$TJMLOADSH" ] && return

#==load built-in files
#--load shared files other than the config and this script next
. "${TJMDOT}/sh/../shells/alias.sh"
. "${TJMDOT}/sh/../shells/short.sh"
if [ "$TJMOS" = 'darwin' ]; then
	. "${TJMDOT}/sh/../shells/mac.sh"
fi

#--load all files other than the config and this script next
for file in $(find "${TJMDOT}/sh/commands" -type f -name '*.sh' ); do
	. "$file"
done
if [ "$TJMSHELL" = 'bash' ] || [ "$TJMSHELL" = 'zsh' ]; then
	for file in $(find "${TJMDOT}/sh/commands" -type f -name '*.bash' ); do
		. "$file"
	done
fi
unset -v file

#--load interactive settings
case "$-" in
	*i*)
		. "${TJMDOT}/sh/interactive.sh"
	;;
esac

#==load local files
#--alias
if [ -f "${TJMDOT}/_local/alias" ]; then
	. "${TJMDOT}/_local/alias"
fi

#--custom
if [ -f "${TJMDOT}/_local/bash" ] && [ "$TJMSHELL" = 'bash' ]; then
	. "${TJMDOT}/_local/bash"
fi

TJMLOADSH=1
