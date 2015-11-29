call plug#begin('~/.vim/plugged_vim')

" programming
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

" editing
Plug 'Raimondi/delimitMate'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/neocomplete.vim'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'

" navigating
Plug 'tpope/vim-vinegar'
Plug 'AndrewRadev/linediff.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'rizzatti/greper.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'osyo-manga/unite-airline_themes'
Plug 'ujihisa/unite-colorscheme'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-help'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/junkfile.vim'

" vim interface
Plug 'bling/vim-bufferline'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'

" python
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jmcantrell/vim-virtualenv'

" javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-jdaddy'

" django
Plug 'mjbrownie/django-template-textobjects'

" misc
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'rizzatti/dash.vim'
Plug 'rizzatti/funcoo.vim'
Plug 'sjl/vitality.vim'
Plug 'tpope/vim-markdown'
Plug 'kana/vim-textobj-user'
Plug 'diepm/vim-rest-console'
Plug 'benmills/vimux'

" haskell
Plug 'dag/vim2hs'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" golang
Plug 'fatih/vim-go'

" rust-lang
Plug 'rust-lang/rust.vim'
Plug 'ebfe/vim-racer'

call plug#end()
