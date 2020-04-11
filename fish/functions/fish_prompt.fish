function fish_prompt
	set_color white -b green
	echo -n '[<'
	echo -n -s "$USER"
	echo -n ':'
	echo -n (basename $PWD)
	echo -n '>] '
	set_color normal
end
