#==load all files
#-@http://stackoverflow.com/a/246128
#-@http://stackoverflow.com/a/14728194
## sh_path=`dirname $0`
#--determine path sh folder
if [[ -z ${BASH_SOURCE[0]} ]]; then
	#==zsh
	sh_path=${0%/*}
else
	#==bash
	sh_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

#--load config first, so that other scripts have access to config
for file in ${sh_path}/config/*.sh; do
	source $file
done

#--load `.env`, if it exists
if test -r ${HOME}/.env; then
	source ${HOME}/.env
fi

#--load shared files other than the config and this script next
source ${sh_path}/../shells/short.sh
if [[ "${TJM_OS}" == 'darwin' ]]; then
	source ${sh_path}/../shells/mac.sh
fi

#--load all files other than the config and this script next
for file in $(find ${sh_path} -type f -name '*.sh' ! -name 'load.sh' ! -regex '\(.*\/config.*\)'); do
	source $file
done
