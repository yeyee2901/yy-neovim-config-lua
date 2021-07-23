function Start()
        " Don't run if: we have commandline arguments, we don't have an empty
        " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
        if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=nvim\=x\=\%[\.exe]$' || &insertmode
                return
        endif

        enew
        setlocal
                \ bufhidden=wipe
                \ buftype=nofile
                \ nobuflisted
                \ nocursorcolumn
                \ nocursorline
                \ nolist
                \ nonumber
                \ noswapfile
                \ norelativenumber

        call append('$', "")
        for line in split(system("cat ~/.config/nvim/start-art$(($RANDOM % 6 + 1)).txt"), '\n')
            call append('$', '        ' . l:line)
        endfor

        let b:display_start = 23
        while line('$') < b:display_start
                call append('$', '')
        endwhile

        call append('$', '                                                  [i]                 Enter insert mode                                ')
        call append('$', '                                                  [SPACE-f-f]         Open Floaterm file browser                       ')
        call append('$', '                                                  [SPACE-t-g-f]       Open Telescope git_files                         ')
        call append('$', '                                                  [SPACE-t-i-n-i-t]   Open Telescope for Neovim Config                 ')
        call append('$', '                                                  [SPACE-t-?]         List Keymap                                      ')
        call append('$', '                                                                                                                       ')
        call append('$', '                                                                                                                       ')
        call append('$', '                                                  https://github.com/yeyee2901/yy-neovim-config-lua                    ')
        call append('$', '                                                                 < YEYEE - 2021 >                                      ')

        " No modifications to this buffer
        setlocal nomodifiable nomodified

        " When we go to insert mode start a new buffer, and start insert
        nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
endfun
