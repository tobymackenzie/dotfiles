#-@ https://github.com/addyosmani/dotfiles/blob/master/.functions#L115
function gitlog
	git log $argv --pretty=format:'-- (%ad:%an): %s' --date=short --no-merges
end
