" Using *.* to avoid conflict with telescope buffers (since telescope
" uses vim buffers to preview)
augroup RememberCodeFolds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END

" Highlight after yanking
augroup Yanking
    autocmd!
    autocmd TextYankPost * lua require("vim.highlight").on_yank({timeout = 300, on_visual = false})
augroup END

" Wrap texts for normal text files & markdown files
augroup WrapNormalFile
    autocmd!
    autocmd BufEnter *.txt,*.md set wrap
augroup END
