function fish_prompt
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
