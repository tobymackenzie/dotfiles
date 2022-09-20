if [[ "${TJM_OS}" == 'darwin' ]]; then
	alias cleardns="dscacheutil -flushcache"
fi
whoisl(){
	whois $* | less
}
