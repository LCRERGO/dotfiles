" Plugin configuration

" Nerdtree configuration
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" FZF configuration
map <leader>f :FZF<CR>

" For airline support
let g:airline_theme='dracula'
let g:airline_powerline_fonts=1
"" tabline extension
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#left_alt_sep='|'

" ALE configuration
let g:ale_list_window_size=5
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
augroup ale_haskell
    autocmd!
    autocmd Filetype haskell let g:ale_linters = { 'haskell':['hlint', 'ghc'] }
augroup END
augroup ale_cpp
    autocmd!
    autocmd Filetype cpp let g:ale_linters = { 'cpp': ['g++', 'clang++'] }
augroup END

" Hexokinase configuration
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

" Python Additional configuration
let g:python_highlight_all = 1

" Go Additional configuration
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Javascript Additional configuration
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
set conceallevel=0
