#==git
alias gitcommit="git diff --cached | less; and git commit"
alias gitcommitall="git add .; and gitcommit"

#-@ https://github.com/addyosmani/dotfiles/blob/master/.functions#L115
function gitlog
	git log $argv --pretty=format:'-- (%ad:%an): %s' --date=short --no-merges
end

#==svn
alias svnstatus="svn status --ignore-externals"
alias svnstatusa="svn status"
alias svnupdate="svn update --ignore-externals"
alias svnupdatea="svnupdate"
