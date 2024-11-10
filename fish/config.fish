if test -z "$TJM_DOTFILES_PATH"
	set -x TJM_DOTFILES_PATH (dirname (dirname (readlink -f (status -f))))
end
source {$TJM_DOTFILES_PATH}/fish/load.fish
