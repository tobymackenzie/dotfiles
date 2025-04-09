function fish_prompt
	#--mode
	if test $fish_bind_mode != 'insert'
		set_color green
		echo -n '>'
		set_color normal
	end
	#--colors
	set tputColors (tput colors 2> /dev/null; or echo 2)
	if test "$tputColors" -gt 8
		set_color black -b 00d787
	else if test "$tputColors" -gt 2
		set_color black -b green
	end
	#--shell level
	if test "$SHLVL" -gt 1
		echo -n '('
		echo -n -s "$SHLVL"
		echo -n ') '
	end
	#--main
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
function __fish_postexec --on-event fish_postexec
	echo '@ '(date '+%H:%M:%S %Y-%m-%d')
end
