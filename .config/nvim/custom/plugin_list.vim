" Plugins(Powered by Plug)
call plug#begin('$XDG_DATA_HOME/nvim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Async syntax checking
Plug 'dense-analysis/ale'

" Completition engine
" REQUIRES: node
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy Finder
Plug 'junegunn/fzf'

" Indentation marcations
Plug 'Yggdroot/indentLine'

" Colors preview
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}

" For the fancy indicator bar
Plug 'vim-airline/vim-airline'
" Themes
Plug 'vim-airline/vim-airline-themes'

" Git bar support
Plug 'tpope/vim-fugitive'

" C/C++ additional sytax
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['C', 'C++']}

" Go Helper
Plug 'fatih/vim-go', {'for': 'go'}

" Guile Helper
Plug 'HiPhish/guile.vim'

" Haskell Helper
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}

" Kotlin Helper
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}

" Haxe Helper
Plug 'jdonaldson/vaxe', {'for': 'haxe'}

" Python additional syntax
Plug 'vim-python/python-syntax', {'for': 'python'}

" Web development
" Expand abbreviations
Plug 'mattn/emmet-vim'
" Surrounds in things
Plug 'tpope/vim-surround'

" Javascript additional syntax
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'html']}
" Typescript syntax
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
" JSX syntax
Plug 'mxw/vim-jsx', {'for': ['javascript', 'typescript']}

" Elm helper
Plug 'ElmCast/elm-vim', {'for': 'elm'}

" Purescript helper
Plug 'purescript-contrib/purescript-vim', {'for': 'purescript'}

" Toml syntax 
Plug 'cespare/vim-toml'

" Icons for the bar
Plug 'ryanoasis/vim-devicons'

" Additional colorscheme
Plug 'dracula/vim', {'as':'dracula'}
call plug#end()
