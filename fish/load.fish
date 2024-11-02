#==load all files
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
source {$TJM_DOTFILES_PATH}/fish/../shells/alias.sh
source {$TJM_DOTFILES_PATH}/fish/../shells/short.sh
if [ $TJM_OS = 'darwin' ]
	source {$TJM_DOTFILES_PATH}/fish/../shells/mac.sh
end

#--load all files other than the config and this script next
for file in (find {$TJM_DOTFILES_PATH}/fish -type f -name '*.fish' ! -name 'config.fish' ! -name 'load.fish' ! -regex '.*\/config\/.*' ! -regex '.*\/functions\/.*')
	source $file
end
