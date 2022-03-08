" ## Install PlugInstall
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ## Install Plugins
if filereadable(expand("~/.vim-plugins"))
    call plug#begin('~/.vim/plugged')
    source ~/.vim-plugins
    call plug#end()
endif

colorscheme gruvbox
