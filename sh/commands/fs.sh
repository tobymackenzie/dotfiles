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

#==apps
#--diff
alias gdiff="git diff --no-index"
alias gdiffw="gdiff -w"

#--edit: edit argument(s) in `vi`. If passed a command, will run that command and pipe to `vi`.  Otherwise, pass as arguments to `vi`.
function e(){
	if [ ! -e $1 ] && [ -x "$(command -v ${1})" ]; then
		#-# use read only for standard in to make it easier to quit. To write, use `:w filename` method
		$@ | vi -R -
	else
		vi $@
	fi
}
#--view: view argument(s) in `less`. If passed a command, will run that command and pipe to `less`.  Otherwise, pass as arguments to `less`.
function v(){
	if [ ! -e $1 ] && [ -x "$(command -v ${1})" ]; then
		$@ | less
	elif [ -d $1 ]; then
		ll $@ | less
	else
		less $@
	fi
}
