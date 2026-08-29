TJMISCRIPT=1
if [ -z "$TJMENVLOADED" ]; then
	. "${TJMDOT}/sh/env.sh"
fi
# shellcheck disable=SC3044
shopt -s expand_aliases 2> /dev/null
. "${TJMDOT}/sh/load.sh"

