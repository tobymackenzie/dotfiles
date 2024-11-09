#--determine OS for later decisions
#-@ http://stackoverflow.com/a/18434831/1139122
#-@ http://stackoverflow.com/a/2264537/1139122
export TJM_OS=`uname | tr '[:upper:]' '[:lower:]'`
case $TJM_OS in
	'windowsnt') TJM_OS='windows' ;;
	'sunos') TJM_OS='solaris' ;;
esac

#--paths
if test -z "${TJM_DOTFILES_PATH}"; then
	export TJM_DOTFILES_PATH=~/.dotfiles
fi
if test -z "${TJM_MAIN_PATH}"; then
	export TJM_MAIN_PATH="${HOME}/__"
fi
if test -z "${TJM_BIN_PATH}"; then
	export TJM_BIN_PATH="${HOME}/bin"
fi
if test -z "${TJM_PROJ_PATH}"; then
	export TJM_PROJ_PATH="${TJM_MAIN_PATH}/checkouts"
fi
if test -z "${TJM_CHECKOUTS_PATH}"; then
	export TJM_CHECKOUTS_PATH="${TJM_PROJ_PATH}"
fi

#--etc
if test -z "${WWW_HOME}"; then
	export WWW_HOME="${TJM_DOTFILES_PATH}/www/index.html"
fi
