#==load all files
#-@ http://stackoverflow.com/a/4407130
set config_path (dirname (status -f))

#--load config first, so that other scripts have access to config
for file in {$config_path}/config/*.fish
	source $file
end

#--load `.env`, if it exists
if test -r $HOME/.env
	#-# must be a simple `VAR='value'` format to work in both `bash` and `fish`
	#-@ https://stackoverflow.com/a/47902450/1139122
	export (cat $HOME/.env | xargs -L 1)
end

#--load all files other than the config and this script next
for file in (find {$config_path} -type f -name '*.fish' ! -name 'config.fish' ! -name 'load.fish' ! -regex '.*\/config\/.*' ! -regex '.*\/functions\/.*')
	source $file
end
