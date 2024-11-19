#--store shell name for `reshell`
set TJM_SHELL fish

#--set dotfiles path
if test -z "$TJM_DOTFILES_PATH"
	set -x TJM_DOTFILES_PATH (dirname (dirname (readlink -f (status -f))))
end

#--load all conf
source {$TJM_DOTFILES_PATH}/fish/load.fish
