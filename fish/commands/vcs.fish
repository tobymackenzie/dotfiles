#==git
alias gitcommit="git diff --cached | less; and git commit"
alias gitcommitall="git add .; and gitcommit"

#--logging
#-@ https://github.com/addyosmani/dotfiles/blob/master/.functions#L115
#-@ https://coderwall.com/p/euwpig
#---short
function gitl
	git log --pretty=format:'%C(green)--%C(reset) %s' --date=short --no-merges $argv
end
#---base for others
set gitlogbase_format '%s %C(green)(%cd) %C(bold blue)<%an> %C(yellow)%h %C(red)%d%C(reset)'
function gitlogbase
	git log --date=iso $argv
end
#---default
function gitlog
	gitlogg $argv
end
#---with graph
function gitlogg
	gitlogbase --graph --pretty=format:' '{$gitlogbase_format} $argv
end
#---with names
function gitlogn
	gitlogbase --name-only --pretty=format:'%C(green)--%C(reset) '{$gitlogbase_format} $argv
end
#---with diff
function gitlogp
	gitlogbase -p --pretty=format:'%C(red)--------------------------------------------------------%C(reset)%n'{$gitlogbase_format}'%n%C(red)--------------------------------------------------------%C(reset)%n' $argv
end

#==svn
alias svnstatus="svn status --ignore-externals"
alias svnstatusa="svn status"
alias svnupdate="svn update --ignore-externals"
alias svnupdatea="svnupdate"
