function fish_user_key_bindings
	#--add emacs and vi keybindings
	fish_default_key_bindings -M insert
	fish_vi_key_bindings --no-erase insert
end
