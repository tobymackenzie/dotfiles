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
	cd "$TJM_BIN_PATH/$*"
}
alias bin='cdbin'
checkouts(){
	cd "$TJM_CHECKOUTS_PATH/$*"
}
alias co="checkouts"

#==stats
case "$TJM_OS" in
	'darwin') alias d="du -hxd 0"; ;;
	*) alias d="du -hx --max-depth 0"; ;;
esac
