#--helper: set env variable
function senv --no-scope-shadowing
	set -x $argv
end
function svar --no-scope-shadowing
	set $argv
end
#--helper: set env variable if not set
function setdefaultenv --no-scope-shadowing
	set -q $argv[1] || senv $argv
end
function setdefaultvar --no-scope-shadowing
	set -q $argv[1] || svar $argv
end

#==load built-in files
#--load config first, so that other scripts have access to config
for file in {$TJMDOT}/fish/config/*.fish
	source $file
end

#--load `.env`, if it exists
if test -r $HOME/.env
	#-# must be a simple `VAR='value'` format to work in both `bash` and `fish`
	#-@ https://stackoverflow.com/a/47902450/1139122
	export (cat $HOME/.env | xargs -L 1)
end

#--load shared files
source {$TJMDOT}/shells/env.sh
source {$TJMDOT}/shells/alias.sh
source {$TJMDOT}/shells/short.sh
if [ $TJMOS = 'darwin' ]
	source {$TJMDOT}/shells/mac.sh
end

#--load all files other than the config and this script next
for file in (find {$TJMDOT}/fish -type f -name '*.fish' ! -name 'config.fish' ! -name 'load.fish' ! -regex '.*\/config\/.*' ! -regex '.*\/functions\/.*')
	source $file
end

#==load local files
#--path
set -x PATH $PATH $TJMDOT/bin
if test -f {$TJMDOT}/_local/path
	for aPath in (cat {$TJMDOT}/_local/path | sed "s!\$PATH!"(echo $PATH)"!" | sed "s!~/!$HOME/!")
		if [ $aPath != '$PATH' -a $aPath != '' -a -d $aPath ]
			set -x PATH $PATH $aPath
		end
	end
	#--unlike bash / zsh, `fish_add_path` will be before OS paths.  Do we want this?
	#for aPath in (cat {$TJMDOT}/_local/path | sed "s!~/!$HOME/!")
		#if [ $aPath != '$PATH' -a $aPath != '' -a -d $aPath ]
			#fish_add_path -a $aPath
		#end
	#end
end

#--aliases
if test -f {$TJMDOT}/_local/alias
	source {$TJMDOT}/_local/alias
end

#--custom
if test -f {$TJMDOT}/_local/fish
	source {$TJMDOT}/_local/fish
end

