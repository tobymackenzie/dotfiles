#--determine OS for later decisions
#-@ http://stackoverflow.com/a/18434831/1139122
#-@ http://stackoverflow.com/a/2264537/1139122
TJMOS=$(uname | tr '[:upper:]' '[:lower:]')
case "$TJMOS" in
	'windowsnt') TJMOS='windows' ;;
	'sunos') TJMOS='solaris' ;;
esac
export TJMOS

#--determine shell info, store shell name for `reshell`
if [ ! -z "${ZSH_VERSION+x}" ]; then
	TJMSHELL=zsh
	TJMSH='0'
elif [ ! -z "${BASH_VERSION+x}" ]; then
	TJMSHELL=bash
	TJMSH='0'
else
	if [ -f /proc/$$/cmdline ]; then
		TJMSHELL="$(cat /proc/$$/cmdline || echo 'sh')"
	else
		# shellcheck disable=SC2034
		TJMSHELL='sh'
	fi
	# shellcheck disable=SC2034
	TJMSH='1'
fi

#--set dotfiles path
#-@http://stackoverflow.com/a/246128
#-@http://stackoverflow.com/a/14728194
if test -z "${TJMDOT}"; then
	TJMDOT="$HOME/.dotfiles"
	export TJMDOT
fi

#--build PATH
if [ -z "$TJMPATHSET" ]; then
	PATH="$PATH:${TJMDOT}/bin"

	#--local
	if [ -f "${TJMDOT}/_local/path" ]; then
		# shellcheck disable=SC2016
		PATH=$(cat "${TJMDOT}/_local/path" | tr '\n' ':' | sed 's!$PATH!'"$PATH"'!' | sed 's!~/!'"$HOME"'/!g' | sed 's/:://g' | xargs)
	fi
	export PATH
	TJMPATHSET=1
	export TJMPATHSET
fi


#--ensure dash loads profile for interactive loads
ENV="$HOME/.profile"
export ENV

#--helper: set env variable
senv(){
	export "$1=$2"
}
svar(){
	eval "$1=\$2"
}
#--helper: set env variable if not set
if ! command -v 'setdefaultenv' > /dev/null; then
	setdefaultenv(){
		eval "tmp=\$$1"
		if [ -z "$tmp" ]; then
			senv "$@"
		fi
		unset tmp
	}
fi
if ! command -v 'setdefaultvar' > /dev/null; then
	setdefaultvar(){
		eval "tmp=\$$1"
		if [ -z "$tmp" ]; then
			svar "$@"
		fi
		unset tmp
	}
fi

#--load shared env
. "${TJMDOT}/sh/../shells/env.sh"

#--load `.env`, if it exists
if test -r "${HOME}/.env"; then
	set -o allexport
	. "${HOME}/.env"
	set +o allexport
fi

# shellcheck disable=SC2034
TJMENVLOADED=1
