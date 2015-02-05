#==git
alias gitcommit="git diff --cached | less && git commit"
alias gitcommitall="git add . && gitcommit"

#--count
alias gitcount="git rev-list HEAD --count"

#--logging
#-@ https://github.com/addyosmani/dotfiles/blob/master/.functions#L115
#-@ https://coderwall.com/p/euwpig
#---short
function gitl(){
	git log --pretty=format:'%C(green)--%C(reset) %s' --date=short --no-merges $@
}
#---base for others
gitlogbase_format="%s %C(green)(%cd) %C(bold blue)<%an> %C(yellow)%h %C(red)%d%C(reset)"
#---default
alias gitlog="gitlogg"
#---with graph
function gitlogg(){
	git log --date=iso --graph --pretty=format:" ${gitlogbase_format}" $@
}
#---with names
function gitlogn(){
	git log --date=iso --name-only --pretty=format:"%C(green)--%C(reset) ${gitlogbase_format}" $@
}
#---with diff
function gitlogp(){
	git log --date=iso -p --pretty=format:"%C(red)--------------------------------------------------------%C(reset)%n${gitlogbase_format}%n%C(red)--------------------------------------------------------%C(reset)%n" $@
}


#==svn
alias svnstatus="svn status --ignore-externals"
alias svnstatusa="svn status"
alias svnupdate="svn update --ignore-externals"
alias svnupdatea="svnupdate"
