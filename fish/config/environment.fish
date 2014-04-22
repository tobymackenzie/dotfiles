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
