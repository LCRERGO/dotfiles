function! s:SetColorScheme()
    " Dynamicaly sets colorscheme
    let myterm = $TERM

    if has('gui_running')
        colorscheme dracula
    elseif l:myterm=~'linux'
        colorscheme murphy
    else
        colorscheme dracula
    endif
endfunction

" Basic configuration
syntax on                   " Enables file syntax
filetype plugin indent on   " Enables plugin helpers
set encoding=utf-8          " Required to insert unicode characters
set number relativenumber   " Show relative line numbers
set modeline                " Allows changing settings by comments
set noswapfile              " Disables the creation of a swapfile
set wildmenu                " Enables tab completion menu
set nohlsearch              " Disables search highlighting
set incsearch               " Enables incremental searching
" Spacing configuration
set autoindent              " Auto-indent new lines
set expandtab               " Turn tabs into spaces
set shiftwidth=4            " Number of auto-indent spaces
set smartindent             " Enable smart-indent
set smarttab                " Enable smart-tabs
set softtabstop=4           " Number of spaces per tab
set foldmethod=indent       " Sets fold by default
set textwidth=79            " Sets the amount of words per line
set linebreak               " Break lines at words
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set splitbelow splitright   " Changes split orientation
set title                   " Shows currently file title
set mouse=a                 " Enables mouse
set termguicolors           " Enables colors
call <SID>SetColorScheme()  " Changes colorscheme

" COC workaround
let g:coc_disable_startup_warning = 1

" Mappings
nnoremap <leader>N :setlocal nonumber! norelativenumber!<cr>
