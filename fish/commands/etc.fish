function c
	set result (echo $argv | bc -l)
	if test -n "$result"
		set -gx C (echo $argv | bc -l)
		echo $C
	end
end
