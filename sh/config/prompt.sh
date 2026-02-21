if [ "$TJM_SHELL" = 'zsh' ]; then
	autoload -U colors && colors
	PS1="[%n:%1d]>"
	#--shell level
	if (( $SHLVL > 1 )); then
		PS1="(${SHLVL}) ${PS1}"
	fi
	#--colors
	tputColors="$(tput colors 2> /dev/null || echo 2)"
	if [ "$tputColors" -gt 2 ]; then
		if [ "$tputColors" -gt 8 ]; then
			PS1="%{$(tput setab 42)$(tput setaf 0)%}${PS1}"
		else
			PS1="%{$bg[green]%}%{$fg[black]%}${PS1}"
		fi
		PS1+="%{$reset_color%}"
	fi
	unset -v tputColors
	precmd(){
		echo "@ $(date '+%H:%M:%S %Y-%m-%d')"
	}
	preexec(){
		echo "@ $(date '+%H:%M:%S %Y-%m-%d')"
	}
	export TJM_PS_BASE="$PS1 "
	export PS1="$TJM_PS_BASE"
else
	if [ "$TJM_SH" = '1' ]; then
		TJM_PSB=" "
		PS1="$ "
	else
		TJM_PSB="\n"
		PS1="[\u:\W]>"
		#--shell level
		if (( $SHLVL > 1 )); then
			PS1="(${SHLVL}) ${PS1}"
		fi
		#--colors
		tputColors="$(tput colors 2> /dev/null || echo 2)"
		if [ "$tputColors" -gt 2 ]; then
			if [ "$tputColors" -gt 8 ]; then
				PS1="\[$(tput setab 42)$(tput setaf 0)\]${PS1}"
			else
				PS1="\[$(tput setab 2)$(tput setaf 0)\]${PS1}"
			fi
			PS1="${PS1}\[$(tput sgr0)\]"
		fi
		unset -v tputColors
	fi
	#-# PS0 shows timestamp before command in BASH>=4.4
	export PS0="@ \$(date '+%H:%M:%S %Y-%m-%d')$TJM_PSB"
	export PS1="@ \$(date '+%H:%M:%S %Y-%m-%d')$TJM_PSB$PS1 "
fi
