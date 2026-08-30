alias -- -="cd -"
if [ -z "$TJMISCRIPT" ]; then
	function /(){
		# shellcheck disable=SC2164
		cd "/$*"
	}
	function __(){
		# shellcheck disable=SC2164
		cd "$HOME/__/$*"
	}
fi
