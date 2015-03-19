call plug#begin('~/.vim/plugged')


" Make sure you use single quotes

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'yantze/pt_black'
Plug 'itchyny/landscape.vim'
Plug 'guns/jellyx.vim'

" general plugins
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/darkspectrum'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'dougireton/vim-chef'

" syntax plugins
Plug 'vim-perl/vim-perl'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim/'
Plug 'jelera/vim-javascript-syntax'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


call plug#end()
