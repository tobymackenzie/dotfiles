"--plug.vim plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"--comments
"> https://vimawesome.com/plugin/the-nerd-commenter
" commands for toggling comments on selected lines
"-@ sublime keymap help via <https://stackoverflow.com/questions/11553382/vim-map-d-to-comment-code>
Plug 'preservim/nerdcommenter'
if has('mac')
	map <D-/> \c<space><CR>
	imap <D-/> <esc>\c<space><CR>gi
else
	map <C-/> \c<space><CR>
	imap <C-/> <esc>\c<space><CR>gi
endif
map <Leader>/ \c<space>

"--text
"---editorconfig
"> https://vimawesome.com/plugin/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

"--vcs
"> https://vimawesome.com/plugin/vim-gitgutter
" shows git line status in gutter
Plug 'airblade/vim-gitgutter'
call plug#end()
