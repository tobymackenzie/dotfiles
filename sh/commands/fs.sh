#==list
lll(){
	ll $@ | less -R
}

#==path movement
alias ..="cd .."
cl(){
	cd $@ && l
}
cll(){
	cd $@ && ll
}
mkcd(){
	mkdir -p $@ && cd $@
}
#--specific
alias ~="cd ~"
cdbin(){
	cd "$TJMLBIN/$*"
}
alias bin='cdbin'
checkouts(){
	if [ ! -e "$TJMCHECKOUT" ]; then
		mdkir -p "$TJMCHECKOUT"
	fi
	cd "$TJMCHECKOUT/$*"
}
alias co="checkouts"

#==stats
case "$TJMOS" in
	'darwin') alias d="du -hxd 0"; ;;
	*) alias d="du -hx --max-depth 0"; ;;
esac
