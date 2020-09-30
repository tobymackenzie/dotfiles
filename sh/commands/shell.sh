#-@ based on <https://meyerweb.com/eric/thoughts/2020/09/29/polite-bash-commands/>
function rodo(){
	if [ ! -e $1 ]; then
		sudo $@
	else
		sudo "$BASH" -c "$(history -p !!)"
	fi
}
