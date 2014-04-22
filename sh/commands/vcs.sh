#==git
alias gitcommit="git diff --cached | less && git commit"
alias gitcommitall="git add . && gitcommit"

#-@ https://github.com/addyosmani/dotfiles/blob/master/.functions#L115
function gitlog(){
	git log $1 $2 --pretty=format:'-- (%ad:%an): %s' --date=short --no-merges
}

#==svn
alias svnstatus="svn status --ignore-externals"
alias svnstatusa="svn status"
alias svnupdate="svn update --ignore-externals"
alias svnupdatea="svnupdate"
