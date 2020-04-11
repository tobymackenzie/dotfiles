function fish_prompt
	set tputColors (tput colors)
	if test "$tputColors" -gt 8
		set_color black -b 00d787
	else
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
