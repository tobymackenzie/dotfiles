#==gui
if [[ "${TJM_OS}" == 'darwin' ]]; then
	alias console="open -a console"
	alias o="open"
	alias oa="open -a"
	alias og="ogit"
	alias ogit="open -a 'GitX'"
	alias ot="open -t"
	alias sublime="oa 'Sublime Text 2'"
	alias macvim="oa MacVim"
fi

#==list
case $TJM_OS in
	'darwin') alias l="ls -FG"; ;;
	*) alias l="ls -F --color"; ;;
esac
alias ll="l -lh"
alias la="l -A"
alias lla="ll -A"
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

#==operations
alias cp="cp -pri"
alias mv="mv -i"
alias rmi=" rm -i"
alias scp="scp -pr"

#==stats
alias du="du -h"
case $TJM_OS in
	'darwin') alias d="du -hxd 0"; ;;
	*) alias d="du -hx --max-depth 0"; ;;
esac
alias d1="d -d 1"
alias df="df -h"
