#-@ based on [zsh unplugged](https://github.com/mattmc3/zsh_unplugged/blob/main/zsh_unplugged.zsh)
function plug {
	local initfile initfiles=() plugdir repo

	[[ -z "$@" ]] && return 0

	#--determine plugin dir
	: ${ZPLUGINDIR:=${ZDOTDIR:-$TJM_DOTFILES_PATH/zsh}/plugins}
	if [[ ! -d $ZPLUGINDIR ]]; then
		mkdir -p $ZPLUGINDIR
	fi

	#--loop through args
	for repo in $@; do
		plugdir=$ZPLUGINDIR/${repo:gs/\//-}
		initfile=$plugdir/${repo:t}.plugin.zsh
		#--install plugin if it hasn't been
		if [[ ! -d $plugdir ]]; then
			echo "Cloning $repo…"
			git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
		fi
		#--set up symlink for init file
		if [[ ! -e $initfile ]]; then
			initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
			(( $#initfiles )) || { echo >&2 "No init file found '$repo'." && continue }
			ln -sf $initfiles[1] $initfile
		fi
		fpath+=$plugdir
		. $initfile
	done
}
while read -r plugin; do
	plug $plugin
done < "$TJM_DOTFILES_PATH/zsh/plugins.txt"
