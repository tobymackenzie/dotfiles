#-@ based on <https://meyerweb.com/eric/thoughts/2020/09/29/polite-bash-commands/>
rodo(){
	if [ -n "$1" ]; then
		sudo bash -c "$*"
	else
		sudo bash -c "$(fc -ln -1)"
	fi
}

#--help
if [ "$TJMSHELL" = 'zsh' ]; then
	#--use zsh's special help files for some internal internal features
	autoload -Uz run-help
	# shellcheck disable=SC2262 # zsh
	alias help='\run-help'
	h(){
		s="$*"
		while [ "$s" = '' ]; do
			printf '%s' "Please enter something to be helped with: "
			read -r s
		done
		if [ -z "$HELPDIR" ]; then
			HELPDIR="/usr/share/zsh/${ZSH_VERSION}/help"
		fi
		#-# need to run twice because it doesn't do error on "failure", must parse to know if we need cheat
		out=$(\run-help "$s" 2> /dev/null)
		# shellcheck disable=SC3010,SC3014 # zsh
		if [[ "$out" == *"$s not found"* ]]; then
			cheat "$s"
		else
			#--some run-help files mention looking at specific man pages but don't show them.  let's show them
			# shellcheck disable=SC2076,SC3010,SC3015 # zsh
			if [[ "$out" =~ "See the section \`([^']+)' in ([^\(]+)" ]]; then
				# shellcheck disable=SC2154,SC3054 # zsh
				man -P "${PAGER:-less} -Ip '${match[1]}'" "${match[2]}"
			else
				\run-help "$s"
			fi
		fi
	}
else
	h(){
		s="$*"
		while [ "$s" = '' ]; do
			printf '%s' "Please enter something to be helped with: "
			read -r s
		done
		# shellcheck disable=SC2263
		help "$s" 2> /dev/null || man "$s" 2> /dev/null || cheat "$s"
	}
fi
