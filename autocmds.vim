" Highlight after yanking
augroup Yanking
    autocmd!
    autocmd TextYankPost * lua require("vim.highlight").on_yank({timeout = 300, on_visual = false})
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
