#--store shell name for `reshell`
set -x TJMSHELL 'fish'

#--set dotfiles path
if test -z "$TJMDOT"
	set -x TJMDOT (dirname (dirname (readlink -f (status -f))))
end

#--load all conf
source {$TJMDOT}/fish/load.fish
