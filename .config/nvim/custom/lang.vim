" Language specific
" Web Languages
autocmd Filetype html setlocal shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal shiftwidth=2 softtabstop=2
autocmd Filetype scss setlocal shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2
autocmd Filetype go setlocal shiftwidth=4 softtabstop=4

" Assembly
autocmd BufNewFile,BufRead *.asm set filetype=nasm
