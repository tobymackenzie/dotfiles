if test -z "$TJM_DOTFILES_PATH"
	#-# for some reason home based path loads much faster
	if test -d ~/.dotfiles 
		and test -f {$TJM_DOTFILES_PATH}/fish/load.fish
		set -x TJM_DOTFILES_PATH ~/.dotfiles
	else
		set -x TJM_DOTFILES_PATH (dirname (dirname (readlink -f (status -f))))
	end
end
source {$TJM_DOTFILES_PATH}/fish/load.fish

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
#---directories
alias cdhome="cd $HOME"
if test -f {$TJM_DOTFILES_PATH}/_local/alias
	source {$TJM_DOTFILES_PATH}/_local/alias
end

#--custom
if test -f {$TJM_DOTFILES_PATH}/_local/fish
	source {$TJM_DOTFILES_PATH}/_local/fish
end

