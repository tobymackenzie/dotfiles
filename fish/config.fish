source ~/.dotfiles/fish/load.fish

#--aliases
#---directories
function __
	cd "$HOME/__/$argv"
end
#alias ~="cd $HOME"
	#alias /="cd /"
alias cdbin="cd ~/bin"
alias bin="cdbin"
alias cdhome="cd $HOME"
