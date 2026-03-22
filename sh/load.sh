#--prevent double load, happens in Vim terminal
[ -n "$TJMLOADSH" ] && return

#--path
if [ -z "$TJMPATHSET" ]; then
	PATH="$PATH:${TJM_DOTFILES_PATH}/bin"
fi

#==load built-in files
#--load shared files other than the config and this script next
. "${TJM_DOTFILES_PATH}/sh/../shells/alias.sh"
. "${TJM_DOTFILES_PATH}/sh/../shells/short.sh"
if [ "$TJM_OS" = 'darwin' ]; then
	. "${TJM_DOTFILES_PATH}/sh/../shells/mac.sh"
fi

#--load all files other than the config and this script next
for file in $(find "${TJM_DOTFILES_PATH}/sh/commands" -type f -name '*.sh' ); do
	. "$file"
done
if [ "$TJM_SHELL" = 'bash' ] || [ "$TJM_SHELL" = 'zsh' ]; then
	for file in $(find "${TJM_DOTFILES_PATH}/sh/commands" -type f -name '*.bash' ); do
		. "$file"
	done
fi
unset -v file

#--load interactive settings
case "$-" in
	*i*)
		. "${TJM_DOTFILES_PATH}/sh/interactive.sh"
	;;
esac

#==load local files
#--path
if [ -z "$TJMPATHSET" ]; then
	if [ -f "${TJM_DOTFILES_PATH}/_local/path" ]; then
		PATH=$(cat "${TJM_DOTFILES_PATH}/_local/path" | tr '\n' ':' | sed "s!\$PATH!"$(echo \"$PATH)\""!" | sed 's!~/!'$(echo "$HOME")'/!g' | sed 's/:://g' | xargs)
	fi
	export PATH
	TJMPATHSET=1
	export TJMPATHSET
fi

#-!! should probably double quote these paths to prevent nefarious sourcing of multiple files
#--alias
if [ -f "${TJM_DOTFILES_PATH}/_local/alias" ]; then
	. "${TJM_DOTFILES_PATH}/_local/alias"
fi

#--custom
if [ -f "${TJM_DOTFILES_PATH}/_local/bash" ] && [ "$TJM_SHELL" = 'bash' ]; then
	. "${TJM_DOTFILES_PATH}/_local/bash"
fi

TJMLOADSH=1
