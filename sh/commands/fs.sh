#==list
lll(){
	ll "$@" | less -R
}

#==path movement
alias ..="cd .."
cl(){
	cd "$@" && l
}
cll(){
	cd "$@" && ll
}
mkcd(){
	# shellcheck disable=SC2164
	mkdir -p "$@" && cd "$@"
}
#--specific
alias ~="cd ~"
cdbin(){
	# shellcheck disable=SC2164
	cd "$TJMLBIN/$*"
}
alias bin='cdbin'
checkouts(){
	if [ ! -e "$TJMCHECKOUT" ]; then
		mdkir -p "$TJMCHECKOUT"
	fi
	# shellcheck disable=SC2164
	cd "$TJMCHECKOUT/$*"
}
alias co="checkouts"

#==stats
case "$TJMOS" in
	'darwin') alias d="du -hxd 0"; ;;
	*) alias d="du -hx --max-depth 0"; ;;
esac
