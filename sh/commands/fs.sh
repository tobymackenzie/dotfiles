#==list
lll(){
	ll $@ | less
}

#==path movement
alias ..="cd .."
alias -- -="cd -"
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
function /(){
	cd /$*
}
function __(){
	cd "$TJM_MAIN_PATH/$*"
}
function cdbin(){
	cd "$TJM_BIN_PATH/$*"
}
alias bin='cdbin'
function checkouts(){
	cd "$TJM_CHECKOUTS_PATH/$*"
}
alias co="checkouts"

#==stats
case $TJM_OS in
	'darwin') alias d="du -hxd 0"; ;;
	*) alias d="du -hx --max-depth 0"; ;;
esac
