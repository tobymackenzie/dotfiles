#!/bin/bash -i
binPath=$(dirname $(realpath ${BASH_SOURCE[0]}))"/../bin"
fromPath=`realpath ${binPath}/..`
toPath=${TJM_DOTFILES_HOME:-${HOME}}

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
	cd $toPath
	toPath=.
	fromPath=./.dotfiles
	relatively=1
fi
while IFS="," read -r left right; do
	if [ "$right" != '' ] && [ "$left" != '' ]; then
		file="${fromPath}/${left}"
		location="${toPath}/${right}"

		#--need to symlink relatively
		if [ $relatively -eq 1 ]; then
			slashes="${right//[^\/]}"
			slashCount=${#slashes}
			if [ $slashCount -gt 0 ]; then
				echo $slashCount
				file=".$file"
				for (( i=1; i<slashCount; ++i )); do
					echo "adding dd"
					file="../$file"
				done
				echo $file
				echo $location
			fi
		fi

		if [ ! -h "$location" ] || [ "$file" != $(readlink "$location") ]; then
			locationDir=`dirname $location`
			if [ ! -d "$locationDir" ]; then
				echo "mkdir -p $locationDir"
				mkdir -p "$locationDir"
			fi
			if ([ -e "$location" ] || [ -h "$location" ]) && [[ "${file}" != $(readlink "${location}") ]]; then
				backupLocation="${location}.bu-"$(date -I)
				#-# /dev/tty to use regular stdin instead of file
				if ${binPath}/_tjmConfirm "Would you like to replace the file ${right} with the dotfile version?  The existing file will be moved to ${backupLocation}. [yN]" 0</dev/tty; then
					echo "mv $location $backupLocation"
					mv $location $backupLocation
				else
					continue
				fi
			fi
			echo "ln -s $file $location"
			ln -s $file $location
		fi
	fi
done < ${binPath}/../src/links.config
