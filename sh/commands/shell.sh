#-@ based on <https://meyerweb.com/eric/thoughts/2020/09/29/polite-bash-commands/>
rodo(){
	if [ -n "$1" ]; then
		sudo bash -c "$*"
	else
		sudo bash -c "$(fc -ln -1)"
	fi
}

#--help
if [ "$TJM_SHELL" = 'zsh' ]; then
	#--use zsh's special help files for some internal internal features
	autoload -Uz run-help
	alias help='\run-help'
	h(){
		s="$@"
		while [ "$s" = '' ]; do
			printf '%s' "Please enter something to be helped with: "
			read -r s
		done
		if [ -z "$HELPDIR" ]; then
			local HELPDIR="/usr/share/zsh/${ZSH_VERSION}/help"
		fi
		#-# need to run twice because it doesn't do error on "failure", must parse to know if we need cheat
		out=`\run-help "$s" 2> /dev/null`
		if [[ "$out" == *"$s not found"* ]]; then
			cheat "$s"
		else
			#--some run-help files mention looking at specific man pages but don't show them.  let's show them
			if [[ "$out" =~ "See the section \`([^']+)' in ([^\(]+)" ]]; then
				man -P "${PAGER:-less} -Ip '${match[1]}'" "$match[2]"
			else
				\run-help "$s"
			fi
		fi
	}
else
	h(){
		s="$@"
		while [ "$s" = '' ]; do
			printf '%s' "Please enter something to be helped with: "
			read -r s
		done
		help "$s" 2> /dev/null || man "$s" 2> /dev/null || cheat "$s"
	}
fi
