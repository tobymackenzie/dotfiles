#==git
alias gitcommit="git diff --cached | less; and git commit"
alias gitcommitall="git add .; and gitcommit"

#--logging
#-@ https://github.com/addyosmani/dotfiles/blob/master/.functions#L115
#-@ https://coderwall.com/p/euwpig
#---short
function gitl
	git log $argv --pretty=format:'%C(green)--%C(reset) %s' --date=short --no-merges
end
#---base for others
set gitlogbase_format '%s %C(green)(%cd) %C(bold blue)<%an> %C(yellow)%h %C(red)%d%C(reset)'
function gitlogbase
	git log $argv --date=iso
end
#---default
function gitlog
	gitlogg $argv
end
#---with graph
function gitlogg
	gitlogbase $argv --graph --pretty=format:' '{$gitlogbase_format}
end
#---with names
function gitlogn
	gitlogbase $argv --name-only --pretty=format:'%C(green)--%C(reset) '{$gitlogbase_format}
end
#---with diff
function gitlogp
	gitlogbase $argv -p --pretty=format:'%C(red)--------------------------------------------------------%C(reset)%n'{$gitlogbase_format}'%n%C(red)--------------------------------------------------------%C(reset)%n'
end

#==svn
alias svnstatus="svn status --ignore-externals"
alias svnstatusa="svn status"
alias svnupdate="svn update --ignore-externals"
alias svnupdatea="svnupdate"
