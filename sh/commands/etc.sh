alias b="bin/console"
function c(){
	result=`echo $* | bc -l`
	if [ ! -z $result ]; then
		C=$result
		echo $C
		export C
	fi
}
alias x="exit"
