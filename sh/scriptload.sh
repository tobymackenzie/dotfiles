TJMISCRIPT=1
if [ -z "$TJM_ENVLOADED" ]; then
	. "${TJM_DOTFILES_PATH}/sh/env.sh"
fi
# shellcheck disable=SC3044
shopt -s expand_aliases 2> /dev/null
. "${TJM_DOTFILES_PATH}/sh/load.sh"

