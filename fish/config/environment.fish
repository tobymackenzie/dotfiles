#--determine OS for later decisions
#-@ http://stackoverflow.com/a/18434831/1139122
#-@ http://stackoverflow.com/a/2264537/1139122
set -x TJM_OS (uname | tr '[:upper:]' '[:lower:]')
switch $TJM_OS
	case 'windowsnt'
		set -x TJM_OS 'windows'
	case 'sunos'
		set -x TJM_OS 'solaris'
end

#--paths
if test -z "$TJM_DOTFILES_PATH"
	set -x TJM_DOTFILES_PATH ~/.dotfiles
end
if test -z "$TJM_MAIN_PATH"
	set -x TJM_MAIN_PATH ~/__
end
if test -z "$TJM_BIN_PATH"
	set -x TJM_BIN_PATH ~/bin
end
if test -z "$TJM_PROJ_PATH"
	set -x TJM_PROJ_PATH $TJM_MAIN_PATH/checkouts
end
if test -z "$TJM_CHECKOUTS_PATH"
	set -x TJM_CHECKOUTS_PATH $TJM_PROJ_PATH
end

#--etc
if test -z "$WWW_HOME"
	set -x WWW_HOME $TJM_DOTFILES_PATH/www/index.html
end

