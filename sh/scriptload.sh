# shellcheck disable=SC2034
TJMISCRIPT=1
if [ -z "$TJMENVLOADED" ]; then
	. "${TJMDOT}/sh/env.sh"
fi
if command -v shopt > /dev/null; then
	# shellcheck disable=SC3044
	shopt -s expand_aliases
fi
. "${TJMDOT}/sh/load.sh"
