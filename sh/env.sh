#--determine OS for later decisions
#-@ http://stackoverflow.com/a/18434831/1139122
#-@ http://stackoverflow.com/a/2264537/1139122
TJM_OS=$(uname | tr '[:upper:]' '[:lower:]')
case "$TJM_OS" in
	'windowsnt') TJM_OS='windows' ;;
	'sunos') TJM_OS='solaris' ;;
esac
export TJM_OS

#--determine shell info, store shell name for `reshell`
if [ ! -z "${ZSH_VERSION+x}" ]; then
	TJM_SHELL=zsh
	TJM_SH='0'
elif [ ! -z "${BASH_VERSION+x}" ]; then
	TJM_SHELL=bash
	TJM_SH='0'
else
	if [ -f /proc/$$/cmdline ]; then
		TJM_SHELL="$(cat /proc/$$/cmdline || echo 'sh')"
	else
		TJM_SHELL='sh'
	fi
	TJM_SH='1'
fi

#--set dotfiles path
#-@http://stackoverflow.com/a/246128
#-@http://stackoverflow.com/a/14728194
if test -z "${TJM_DOTFILES_PATH}"; then
	if [ "$TJM_SH" = '1' ]; then
		TJM_DOTFILES_PATH="$HOME/.dotfiles"
	else
		TJM_DOTFILES_PATH=$(dirname $(dirname $(readlink -f "${BASH_SOURCE[0]:-${(%):-%x}}")))
	fi
	export TJM_DOTFILES_PATH
fi

#--ensure dash loads profile for interactive loads
ENV="$HOME/.profile"
export ENV

#--helper: set env variable
senv(){
	export "$1=$2"
}
#--helper: set env variable if not set
if [ "$TJM_SHELL" = 'zsh' ]; then
	setdefaultenv(){
		if [ -z "${(P)1}" ]; then
			senv $*
		fi
	}
elif [ "$TJM_SHELL" = 'bash' ]; then
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

#--load shared env
. "${TJM_DOTFILES_PATH}/sh/../shells/env.sh"

#--load `.env`, if it exists
if test -r "${HOME}/.env"; then
	set -o allexport
	. "${HOME}/.env"
	set +o allexport
fi

TJM_ENVLOADED=1
