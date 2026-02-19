#==apps
alias oa="open -a"
alias sublime="oa 'Sublime Text 2'"
alias macvim="oa MacVim"

#==net
alias cleardns="dscacheutil -flushcache"

#==system monitoring
alias top='top -F -s 2 -S -ocpu -stats pid,command,user,cpu,time,mem,state,threads,cpu_me,ppid'
alias tcpu="\\top -S -F -ocpu -s 2 -stats pid,command,cpu,user,time,mem,threads,state"
alias tmem='\top -S -orsize -s 5 -stats pid,command,mem,purg,cmprs,user,cpu,time,threads,state'
alias tt="\\top -S -n 0 -s 5"
alias ttime='\top -F -otime -s 5 -stats pid,command,time,cpu,user,mem,threads,state'

