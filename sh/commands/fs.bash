alias -- -="cd -"
if [ -z "$TJMISCRIPT" ]; then
	function /(){
		cd /$*
	}
	function __(){
		cd "~/__/$*"
	}
fi
