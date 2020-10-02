#-@ based on <https://meyerweb.com/eric/thoughts/2020/09/29/polite-bash-commands/>
function rodo(){
	if [ -n "$1" ]; then
		sudo bash -c "$*"
	else
		sudo bash -c "$(fc -ln -1)"
	fi
}
