if [ $TJM_OS = 'darwin' ]
	alias cleardns="dscacheutil -flushcache"
end
alias ssha="ssh -A"
function whoisl
	whois $argv | less
end
