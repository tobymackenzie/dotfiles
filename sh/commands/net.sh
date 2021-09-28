if [[ "${TJM_OS}" == 'darwin' ]]; then
	alias cleardns="dscacheutil -flushcache"
fi
alias ssha="ssh -A"
whoisl(){
	whois $* | less
}
