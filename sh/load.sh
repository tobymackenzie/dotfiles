#--helper: set env variable if not set
if [ ! -z "${ZSH_VERSION+x}" ]; then
	#--zsh
	setdefaultenv(){
		if [ -z ${(P)1} ]; then
			export "$1=$2"
		fi
	}
else
	#--bash.  may need to use eval for other sh
	setdefaultenv(){
		if [ -z "${!1}" ]; then
			export "$1=$2"
		fi
	}
fi

#==load all files
#--load config first, so that other scripts have access to config
for file in ${TJM_DOTFILES_PATH}/sh/config/*.sh; do
	source $file
done

#--load `.env`, if it exists
if test -r ${HOME}/.env; then
	source ${HOME}/.env
fi

#--load shared files other than the config and this script next
source ${TJM_DOTFILES_PATH}/sh/../shells/env.sh
source ${TJM_DOTFILES_PATH}/sh/../shells/alias.sh
source ${TJM_DOTFILES_PATH}/sh/../shells/short.sh
if [[ "${TJM_OS}" == 'darwin' ]]; then
	source ${TJM_DOTFILES_PATH}/sh/../shells/mac.sh
fi

#--load all files other than the config and this script next
for file in $(find ${TJM_DOTFILES_PATH}/sh -type f -name '*.sh' ! -name 'load.sh' ! -regex '\(.*\/config.*\)'); do
	source $file
done
unset -v file
