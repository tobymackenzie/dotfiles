function fish_mode_prompt
	switch $fish_bind_mode
		case insert
			echo -ne "\e]112\a" #--normal cursor color
		case '*'
			echo -ne "\e]12;#0c0\a" #--green cursor
			set_color green
			echo -n '>'
			set_color normal
	end
end
