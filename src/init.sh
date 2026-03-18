#!/bin/bash -i
binPath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/../bin"
fromPath="$(realpath "${binPath}/..")"
toPath=${TJM_DOTFILES_HOME:-${HOME}}
testing="${TJMTESTINIT:-0}"

main(){
echo "placing all dotfiles"

#==place base dir
if [ ! -e "${toPath}/.dotfiles" ]; then
	echo "ln -s $fromPath ${toPath}/.dotfiles"
	ln -s "$fromPath" "${toPath}/.dotfiles"
fi

#==place dot files
#--if we have .dotfiles shortcut, let's do relative links to there for movability
relatively=0
if [[ "$fromPath" == $(readlink "${toPath}/.dotfiles") ]]; then
	cd "$toPath" || exit
	toPath=.
	fromPath=./.dotfiles
	relatively=1
fi

placeFile etc/editorconfig .editorconfig
placeFile git .config/git
placeFile sh/profile .profile
placeFile x/Xresources .Xresources

if hasCmd atom; then
	placeFile atom .atom
fi
if hasCmd fish; then
	placeFile fish/config.fish .config/fish/config.fish
	placeFile fish/functions .config/fish/functions
fi
if hasCmd i3; then
	placeFile i3 .config/i3
	placeFile i3status .config/i3status
fi
if hasCmd screen; then
	placeFile screen/screenrc .screenrc
fi
if hasCmd bash; then
	placeFile sh/bash_profile .bash_profile
	placeFile sh/bashrc .bashrc
fi
if hasCmd vim; then
	placeFile vim .vim
fi
if hasCmd zsh; then
	placeFile zsh/zshenv .zshenv
	placeFile zsh/zshrc .zshrc
fi
}

#==helpers
hasCmd(){
	[ "$testing" -eq 1 ] || command -v "$1" > /dev/null
}
placeFile(){
	left="$1"
	right="$2"
	if [ "$right" != '' ] && [ "$left" != '' ]; then
		file="${fromPath}/${left}"
		location="${toPath}/${right}"

		#--need to symlink relatively
		if [ $relatively -eq 1 ]; then
			slashes="${right//[^\/]}"
			slashCount=${#slashes}
			if [ "$slashCount" -gt 0 ]; then
				file=".$file"
				for (( i=1; i<slashCount; ++i )); do
					file="../$file"
				done
			fi
		fi

		if [ ! -h "$location" ] || [ "$file" != "$(readlink "$location")" ]; then
			locationDir=$(dirname "$location")
			if [ ! -d "$locationDir" ]; then
				echo "mkdir -p $locationDir"
				mkdir -p "$locationDir"
			fi
			if { [ -e "$location" ] || [ -h "$location" ]; } && [[ "${file}" != "$(readlink "${location}")" ]]; then
				backupLocation="${location}.bu-"$(date -I)
				#-# /dev/tty to use regular stdin instead of file
				if "$binPath/_tjmConfirm" "Would you like to replace the file ${right} with the dotfile version?  The existing file will be moved to ${backupLocation}. [yN]" 0</dev/tty; then
					echo "mv $location $backupLocation"
					mv "$location" "$backupLocation"
				else
					return
				fi
			fi
			echo "ln -s $file $location"
			ln -s "$file" "$location"
		fi
	fi
}

#==go
main
