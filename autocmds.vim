" Highlight after yanking
augroup Yanking
    autocmd!
    autocmd TextYankPost * lua require("vim.highlight").on_yank({timeout = 300, on_visual = false})
augroup END

" Enable transparency
" Default Normal: guibg=#282C34
" Default Line NR: guifg=#969896 guibg=#282a2e
" Default Sign Col: guifg=#969896 guibg=#282a2e
augroup TransparentBackground
    autocmd!
    autocmd VimEnter,BufEnter *.* highlight LineNr guibg=#282c34
    autocmd VimEnter,BufEnter *.* highlight SignColumn guibg=#282c34
    autocmd VimEnter,BufEnter *.* highlight Normal guibg=#282c34
augroup END

augroup CIndentation
    autocmd!
augroup END

" For c like files, clang formatting insist using 2 spaces
augroup NonCIndent
    autocmd!
    autocmd FileType c,cpp,objc,objcpp,lua set tabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua set softtabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua set shiftwidth=2
augroup END
