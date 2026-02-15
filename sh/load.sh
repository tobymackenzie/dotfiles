#--helper: set env variable
senv(){
	export "$1=$2"
}
#--helper: set env variable if not set
if [ ! -z "${ZSH_VERSION+x}" ]; then
	#--zsh
	setdefaultenv(){
		if [ -z "${(P)1}" ]; then
			senv $*
		fi
	}
elif [ "$TJM_SHELL" = 'bash' ]; then
	#--bash.  may need to use eval for other sh
	setdefaultenv(){
		if [ -z "${!1}" ]; then
			senv $*
		fi
	}
else
	setdefaultenv(){
		eval "tmp=\$$1"
		if [ -z "$tmp" ]; then
			senv $*
		fi
		unset tmp
	}
fi

#==load built-in files
#--load config first, so that other scripts have access to config
for file in "${TJM_DOTFILES_PATH}"/sh/config/*.sh; do
	. "$file"
done

#--load `.env`, if it exists
if test -r "${HOME}/.env"; then
	set -o allexport
	. "${HOME}/.env"
	set +o allexport
fi

#--load shared files other than the config and this script next
. "${TJM_DOTFILES_PATH}/sh/../shells/env.sh"
. "${TJM_DOTFILES_PATH}/sh/../shells/alias.sh"
. "${TJM_DOTFILES_PATH}/sh/../shells/short.sh"
if [ "$TJM_OS" = 'darwin' ]; then
	. "${TJM_DOTFILES_PATH}/sh/../shells/mac.sh"
fi

#--load all files other than the config and this script next
for file in $(find "${TJM_DOTFILES_PATH}/sh" -type f -name '*.sh' ! -name 'load.sh' ! -regex '\(.*\/config.*\)'); do
	. "$file"
done
if [ "$TJM_SHELL" = 'bash' ] || [ "$TJM_SHELL" = 'zsh' ]; then
	for file in $(find "${TJM_DOTFILES_PATH}/sh" -type f -name '*.bash' ! -regex '\(.*\/config.*\)'); do
		. "$file"
	done
fi
unset -v file


#==load local files
#--path
export PATH="$PATH:${TJM_DOTFILES_PATH}/bin"
if [ -f "${TJM_DOTFILES_PATH}/_local/path" ]; then
	export PATH=$(cat "${TJM_DOTFILES_PATH}/_local/path" | tr '\n' ':' | sed "s!\$PATH!"$(echo \"$PATH)\""!" | sed 's!~/!'$(echo "$HOME")'/!g' | sed 's/:://g' | xargs)
fi

#-!! should probably double quote these paths to prevent nefarious sourcing of multiple files
#--alias
if [ -f "${TJM_DOTFILES_PATH}/_local/alias" ]; then
	. "${TJM_DOTFILES_PATH}/_local/alias"
fi

#--custom
if [ -f "${TJM_DOTFILES_PATH}/_local/bash" ] && [ "$TJM_SHELL" = 'bash' ]; then
	. "${TJM_DOTFILES_PATH}/_local/bash"
fi

