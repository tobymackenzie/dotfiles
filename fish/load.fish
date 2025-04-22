#--helper: set env variable
function senv --no-scope-shadowing
	set -x $argv
end
#--helper: set env variable if not set
function setdefaultenv --no-scope-shadowing
	set -q $argv[1] || senv $argv
end

#==load built-in files
#--load config first, so that other scripts have access to config
for file in {$TJM_DOTFILES_PATH}/fish/config/*.fish
	source $file
end

#--load `.env`, if it exists
if test -r $HOME/.env
	#-# must be a simple `VAR='value'` format to work in both `bash` and `fish`
	#-@ https://stackoverflow.com/a/47902450/1139122
	export (cat $HOME/.env | xargs -L 1)
end

#--load shared files
source {$TJM_DOTFILES_PATH}/shells/env.sh
source {$TJM_DOTFILES_PATH}/shells/alias.sh
source {$TJM_DOTFILES_PATH}/shells/short.sh
if [ $TJM_OS = 'darwin' ]
	source {$TJM_DOTFILES_PATH}/shells/mac.sh
end

#--load all files other than the config and this script next
for file in (find {$TJM_DOTFILES_PATH}/fish -type f -name '*.fish' ! -name 'config.fish' ! -name 'load.fish' ! -regex '.*\/config\/.*' ! -regex '.*\/functions\/.*')
	source $file
end

#==load local files
#--path
set -x PATH $PATH $TJM_DOTFILES_PATH/bin
if test -f {$TJM_DOTFILES_PATH}/_local/path
	for aPath in (cat {$TJM_DOTFILES_PATH}/_local/path | sed "s!\$PATH!"(echo $PATH)"!" | sed "s!~/!$HOME/!")
		if [ $aPath != '$PATH' -a $aPath != '' -a -d $aPath ]
			set -x PATH $PATH $aPath
		end
	end
	#--unlike bash / zsh, `fish_add_path` will be before OS paths.  Do we want this?
	#for aPath in (cat {$TJM_DOTFILES_PATH}/_local/path | sed "s!~/!$HOME/!")
		#if [ $aPath != '$PATH' -a $aPath != '' -a -d $aPath ]
			#fish_add_path -a $aPath
		#end
	#end
end

#--aliases
if test -f {$TJM_DOTFILES_PATH}/_local/alias
	source {$TJM_DOTFILES_PATH}/_local/alias
end

#--custom
if test -f {$TJM_DOTFILES_PATH}/_local/fish
	source {$TJM_DOTFILES_PATH}/_local/fish
end

