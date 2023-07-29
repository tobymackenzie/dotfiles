source ~/.dotfiles/fish/load.fish

#--path
set -x PATH $PATH ~/.dotfiles/bin
if test -f ~/.dotfiles/_local/path
	for aPath in (cat ~/.dotfiles/_local/path | sed "s!\$PATH!"(echo $PATH)"!" | sed "s!~/!$HOME/!")
		if [ $aPath != '$PATH' -a $aPath != '' -a -d $aPath ]
			set -x PATH $PATH $aPath
		end
	end
	#--unlike bash / zsh, `fish_add_path` will be before OS paths.  Do we want this?
	#for aPath in (cat ~/.dotfiles/_local/path | sed "s!~/!$HOME/!")
		#if [ $aPath != '$PATH' -a $aPath != '' -a -d $aPath ]
			#fish_add_path -a $aPath
		#end
	#end
end

#--aliases
#---directories
alias cdhome="cd $HOME"
if test -f ~/.dotfiles/_local/alias
	source ~/.dotfiles/_local/alias
end

#--custom
if test -f ~/.dotfiles/_local/fish
	source ~/.dotfiles/_local/fish
end

