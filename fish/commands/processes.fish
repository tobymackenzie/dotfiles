#==manage
alias stop="killall -STOP"
alias cont="killall -CONT"

#==monitor
alias t="top -S -n 0 -s 5"
alias tcpu="top -S -ocpu -s 2"
alias tmem='top -S -orsize -s 5'
alias ttime='top -otime -s 5'
