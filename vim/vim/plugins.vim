"--plug.vim plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"--autocomplete
"> https://github.com/Valloric/YouCompleteMe
" ycm requires macvim on mac, and requires `cmake` installed
if (has('gui_macvim') || has('linux')) && executable('cmake')
	Plug 'valloric/youcompleteme', {'do': './install.py'}
endif
call plug#end()
