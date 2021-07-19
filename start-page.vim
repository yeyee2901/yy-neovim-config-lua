function InsertNewLine()
        call append('$', '')
endfun
function Start()
        " Don't run if: we have commandline arguments, we don't have an empty
        " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
        if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=nvim\=x\=\%[\.exe]$' || &insertmode
                return
        endif

        " Start a new buffer ...
        enew

        " ... and set some options for it
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

        " Now we can just write to the buffer, whatever you want.
        call append('$', '                        |                    YYYY                     YYYY                                         |')
        call append('$', '                        |                    YYYY                     YYYY                                         |')
        call append('$', '                        |                    YYYY                     YYYY                                         |')
        call append('$', '                        |                    YYYY                     YYYY                                         |')
        call append('$', '                        |                    YYYY                     YYYY                                         |')
        call append('$', '                        |                    YYYY                     YYYY                                         |')
        call append('$', '                        |                    YYYY                     YYYY                                         |')
        call append('$', '                        |                    YYYY                     YYYY      22222222222                        |')
        call append('$', '                        |                     YYYYY                   YYYY    222         222                      |')
        call append('$', '                        |                       YYYYYYYYYYYYYYYYYYYYYYYYYY   222           222                     |')
        call append('$', '                        |                         YYYYYYYYYYYYYYYYYYYYYYYY                 222                     |')
        call append('$', '                        |                                            YYYY                222                       |')
        call append('$', '                        |                                            YYYY               222                        |')
        call append('$', '                        |                                            YYYY             222                          |')
        call append('$', '                        |                                            YYYY           222                            |')
        call append('$', '                        |                                            YYYY         222                              |')
        call append('$', '                        |                                            YYYY        222                               |')
        call append('$', '                        |                     YYY                  YYYY        222                                 |')
        call append('$', '                        |                      YYY                YYYY       222                                   |')
        call append('$', '                        |                        YYYYYYYYYYYYYYYYYYY       2222222222222222                        |')
        call append('$', '                        |                         YYYYYYYYYYYYYYYY         2222222222222222                        |')
        call append('$', '                        |                                                                                          |')
        call append('$', '                        |                                                                                          |')
        call append('$', '                        |                         Configuration by:    yeyee2901 - 2021                            |')
        call append('$', '                        |                    https://github.com/yeyee2901/yy-neovim-config-lua                     |')
        call append('$', '                        |                                                                                          |')
        call append('$', '                        |                                                                                          |')
        call append('$', '                        |                     [i]                 Enter insert mode                                |')
        call append('$', '                        |                     [SPACE-f-f]         Open Floaterm file browser                       |')
        call append('$', '                        |                     [SPACE-t-g-f]       Open Telescope git_files                         |')
        call append('$', '                        |                     [SPACE-t-i-n-i-t]   Open Telescope for Neovim Config                 |')
        call append('$', '                        |                     [SPACE-t-?]         List Keymap                                      |')
        call append('$', '                        |                                                                                          |')
        call append('$', '                        |                                                                                          |')
        call append('$', '                        |                                                                                          |')
        call append('$', '                        |                                                                                          |')

        "for line in split(system('cowsay "This is yeyee2901"'), '\n')
        "        call append('$', '        ' . l:line)
        "endfor

        " No modifications to this buffer
        setlocal nomodifiable nomodified

        " When we go to insert mode start a new buffer, and start insert
        nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
endfun
