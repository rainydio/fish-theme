function fish_title
	if [ (count $argv) = 1 ]
		echo "$argv"
	else
		prompt_pwd
	end
end