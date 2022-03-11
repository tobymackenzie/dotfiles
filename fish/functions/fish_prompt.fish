function fish_prompt
	echo '@ '(date '+%H:%M:%S %Y-%m-%d')
	set tputColors (tput colors 2> /dev/null; or echo 2)
	if test "$tputColors" -gt 8
		set_color black -b 00d787
	else if test "$tputColors" -gt 2
		set_color white -b green
	end
	echo -n '['
	echo -n -s "$USER"
	echo -n ':'
	echo -n (basename $PWD)
	echo -n ']>'
	set_color normal
	echo -n ' '
end

#--show datetime upon command execution
function __fish_preexec --on-event fish_preexec
	echo '@ '(date "+%H:%M:%S %Y-%m-%d")
end
