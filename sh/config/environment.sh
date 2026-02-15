#--determine OS for later decisions
#-@ http://stackoverflow.com/a/18434831/1139122
#-@ http://stackoverflow.com/a/2264537/1139122
export TJM_OS=`uname | tr '[:upper:]' '[:lower:]'`
case "$TJM_OS" in
	'windowsnt') TJM_OS='windows' ;;
	'sunos') TJM_OS='solaris' ;;
esac
