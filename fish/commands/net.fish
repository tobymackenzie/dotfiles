if [ $TJM_OS = 'darwin' ]
	alias cleardns="dscacheutil -flushcache"
end
function whoisl
	whois $argv | less
end
