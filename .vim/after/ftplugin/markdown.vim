" Enable spell checking.
set spelllang=en_gb spell

" Do not wrap words.
setlocal formatoptions-=c
setlocal formatoptions-=t

" Clode NERDTree.
augroup markdown_startup
    au!
    au VimEnter * NERDTreeClose
augroup END
